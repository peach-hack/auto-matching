module AutoMatching
  module MultiLogger
    class << self
      delegate(
        :debug,
        :info,
        :warn,
        :error,
        :fatal,
        to: :logger
      )

      def logger
        @logger ||= begin
          logger = ActiveSupport::Logger.new(logfile_name)
          logger.formatter = Logger::Formatter.new
          logger.datetime_format = logdate_format

          srdout_logger = ActiveSupport::Logger.new(STDOUT)
          multiple_loggers = ActiveSupport::Logger.broadcast(srdout_logger)

          logger.extend(multiple_loggers)

          logger
        end
      end

      private
        def logfile_name
          Rails.root.join("log", "application.log")
        end

        def logdate_format
          "%Y-%m-%d %H:%M:%S"
        end
    end
  end
end
