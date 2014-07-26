module Application
  class InteractionBuilder
    def self.build
      Interaction.new(Utils::TextImporter.new, Utils::StandardExporter.new, Dispatcher.new)
    end
  end
end