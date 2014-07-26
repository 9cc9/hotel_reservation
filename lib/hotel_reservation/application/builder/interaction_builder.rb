module Application
  class InteractionBuilder
    def self.build
      Interaction.new(Utils::TextImporter.new)
    end
  end
end