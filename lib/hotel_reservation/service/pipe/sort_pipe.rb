module Service
  module Pipe
    class SortPipe < BasePipe
      def initialize(parent_pipe, type, *args)
        @parent_pipe, @type, @args = parent_pipe, type, args
      end

      def run(row_data)
        data = @parent_pipe.run(row_data)
        data.sort_by { |h| h.send(@type, *@args) }
      end
    end
  end
end
