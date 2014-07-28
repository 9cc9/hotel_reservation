module Command
  class Base
    include Utils::Abstract

    # @return [String]  Output info to viewer
    abstract_methods :handle
  end
end