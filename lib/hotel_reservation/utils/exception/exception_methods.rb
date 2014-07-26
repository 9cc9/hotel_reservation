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

    def illegally_date(dates)
      raise IllegalInputError.new("不能识别的日期：#{dates}")
    end

    def is_valid_type?(condition, type)
      raise IllegalInputError.new("不能识别的用户类型：#{type}") unless condition
    end
  end
end