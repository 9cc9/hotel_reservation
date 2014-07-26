# encoding: utf-8

module Utils
  module Abstract
    include ExceptionMethods

    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def abstract_methods(*args)
        args.each do |name|
          class_eval do
            define_method("#{name}") do |*params|
              must_be_implemented(name)
            end
          end
        end
      end
    end
  end
end