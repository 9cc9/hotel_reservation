# encoding: utf-8
require 'spec_helper'

module Command
  module Parameter
    describe ReserveParameter do

      describe '#initialize' do
        context 'when format of line is correct.' do
          before do
            @parameter = ReserveParameter.new('reserve', 'Regular: 16Mar2009(mon), 17Mar2009(tues), 18Mar2009(wed)')
          end

          it 'should parse to custom type.' do
            @parameter.custom_type.should == :regular
          end

          it 'should parse to correct days.' do
            @parameter.days[0].wday.should eq 1
            @parameter.days[1].wday.should eq 2
            @parameter.days[2].wday.should eq 3
          end
        end

        context 'when days of line is empty.' do
          before do
            @parameter = ReserveParameter.new('reserve', 'Rewards:')
          end

          it 'should parse to custom type.' do
            @parameter.custom_type.should == :rewards
          end

          it 'should get empty days.' do
            @parameter.days.should == []
          end
        end

        context 'when format of input line is invalid.' do

          it 'should parse to custom type.' do
            expect { ReserveParameter.new('reserve', 'RR:XXX YYY') }.to raise_error(Utils::ExceptionMethods::IllegalInputError) {
                |e| e.message.should == '不能识别的用户类型：RR' }
          end

          it 'should get illegally date exception.' do
            expect { ReserveParameter.new('reserve', 'Regular:XXX YYY') }.to raise_error(Utils::ExceptionMethods::IllegalInputError) {
                |e| e.message.should == '不能识别的日期：XXX YYY' }
          end
        end
      end
    end
  end
end
