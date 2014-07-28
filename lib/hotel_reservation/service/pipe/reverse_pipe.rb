module Service
  module Pipe
    class ReversePipe < BasePipe
      def initialize(parent_pipe)
        @parent_pipe = parent_pipe
      end

      def run(row_data)
        data = @parent_pipe.run(row_data)
        data.reverse
      end
    end
  end
end
