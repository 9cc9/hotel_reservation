module Command
  class Help < Base

    # @return [String] 输出到界面的提示信息
    def handle(parameter)
      parameter.info
    end
  end
end