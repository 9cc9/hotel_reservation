# encoding: utf-8

module Command
  module Parameter
    class HelpParameter < Base
      HELP_INFO = ("Usage: [quit][help][输入格式为<customer_type>: <date1>, <date2>, <date3>, ...]\n" +
          "eg.Rewards: 26Mar2009(thur), 27Mar2009(fri), 28Mar2009(sat)\n" +
          'eg.quit').freeze

      def initialize(type, argument)
        super(type, argument)
        @info = HELP_INFO
      end
    end
  end
end