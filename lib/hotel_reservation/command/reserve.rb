module Command
  class Reserve < Base

    def handle(parameter)
      service = Service::Builder::ChargeServiceBuilder.build(parameter.custom_type)

      parameter.info
    end
  end
end