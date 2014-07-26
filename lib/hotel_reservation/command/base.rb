module Command
  class Base
    include Utils::Abstract

    # @return [String] 输出到界面的提示信息
    abstract_methods :handle
  end
end