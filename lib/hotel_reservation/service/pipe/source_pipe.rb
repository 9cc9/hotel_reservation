module Service
  module Pipe
    class SourcePipe < BasePipe
      def run(row_data)
        row_data
      end
    end
  end
end
