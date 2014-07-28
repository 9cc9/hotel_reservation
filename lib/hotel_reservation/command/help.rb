module Command
  class Help < Base

    # @return [String]  Output info to viewer
    def handle(parameter)
      parameter.info
    end
  end
end