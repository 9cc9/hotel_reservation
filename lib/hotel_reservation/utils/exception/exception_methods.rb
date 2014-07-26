# encoding: utf-8

module Utils
  module ExceptionMethods
    class IllegalInputError < StandardError; end

    def must_be_implemented(name = '')
      raise NotImplementedError.new("You must implement #{name}.")
    end

    def illegally_spelling(line)
      raise IllegalInputError.new("不能识别的命令：#{line}")
    end
  end
end