module Service
  module Pipe
    class BasePipe
      include Utils::Abstract

      abstract_methods :run
    end
  end
end
