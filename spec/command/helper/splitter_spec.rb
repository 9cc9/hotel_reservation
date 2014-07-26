# encoding: utf-8
require 'spec_helper'

module Command
  describe Delete do
    include Helper::Http

    context '#handle' do
      before do
        initialize_connection
        @command = Delete.new
        @packet = Packet::PacketFactory.new.get_instance_by_xml(
            File.open(Background::ROOT+ '/public/xml/delete_resource/request.xml').read)
      end

      context 'when controller has right to delete resource' do
        before do
          @metadata = Factory.create(:metadatum, {:audit_status => Util::AUDIT_PASS, :sync_status => Util::BEING_SYNC_STATUS})
          @metadata.update_attribute(:identifier, 'RESOURCE_IDENTIFIER')
          @controller = Factory.create(:controller)
          @controller.update_attribute(:identifier, 'CONTROLLER_IDENTIFIER')
        end

        it 'should get a normal response.' do
          @command.handle(@packet)
          Model::Metadatum.find_by_identifier('RESOURCE_IDENTIFIER').status.should == Util::DELETED_STATUS
        end
      end

      context 'when controller does not have the right to delete the resource' do
        before do
          @metadata = Factory.create(:traffic_metadatum)
          @metadata.update_attribute(:identifier, 'RESOURCE_IDENTIFIER')

          Factory.create(:controller).update_attribute(:identifier, 'CONTROLLER_IDENTIFIER')
        end

        it 'should get a error response.' do
          expect { @command.handle(@packet) }.to raise_error(CustomException::AccessFailedError) { |e|
            e.error_cause.should == '无权限修改该资源！' }
        end
      end

      context 'when the resource is not exist' do
        it 'should get a error response.' do
          expect { @command.handle(@packet) }.to raise_error(CustomException::AccessFailedError) { |e|
            e.error_cause.should == '该资源不存在！' }
        end
      end
    end
  end
end
