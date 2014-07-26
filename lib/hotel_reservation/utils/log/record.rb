require 'logger'

module Log
  class MultiIO
    def initialize(*targets)
      @targets = targets
    end

    def write(*args)
      @targets.each {|t| t.write(*args)}
    end

    def close
      @targets.each(&:close)
    end
  end

  class Record
    # DEBUG < INFO < WARN < ERROR < FATAL
    # logger.debug/info/warn/error/fatal
    def self.logger
      @logger ||= get_instance
    end

    def self.close
      logger.close
    end

    private
    def self.get_instance
      file = open(file_name, File::WRONLY | File::APPEND | File::CREAT)
      file.sync = true  # Logger without buffer
      logger = Logger.new(MultiIO.new(file, STDIN), 'daily')
      logger.level = levels[configure['level'].to_sym]
      logger.datetime_format = '%Y-%m-%d %H:%M:%S'
      logger.formatter = proc { |severity, datetime, _, msg|
        "[#{datetime}]: [#{severity}]#{msg}\n"
      }
      logger
    end

    def self.file_name
      "#{Util::Configure.instance.log_config['file_name']}"
    end

    def self.levels
      {
          :debug => Logger::DEBUG,
          :info => Logger::INFO,
          :warn => Logger::WARN,
          :error => Logger::ERROR,
          :fatal => Logger::FATAL,
          :unknown => Logger::UNKNOWN
      }
    end
  end
end