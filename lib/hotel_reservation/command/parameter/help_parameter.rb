module Command
  module Parameter
    class HelpParameter < Base
      def initialize(argument)
        super(argument)
        @output = "Usage: [quit][help][输入格式为<customer_type>: <date1>, <date2>, <date3>, ...]\n" +
            "eg.Rewards: 26Mar2009(thur), 27Mar2009(fri), 28Mar2009(sat)\n" +
            'eg.quit'
      end
    end
  end
end