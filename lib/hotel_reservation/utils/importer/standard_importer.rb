module Utils
  class StandardImporter
    def each
      while true do
        yield gets.chomp
      end
    end
  end
end
