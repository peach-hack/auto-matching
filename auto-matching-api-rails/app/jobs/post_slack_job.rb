class PostSlackJob < AutoJob
  def perform(sender_class_s, area_list = nil, genre_list = nil)
    klass = sender_class_s.constantize

    @start_time = time_now

    # AutoMatching::Reader::Executor.new.run(klass, area_list, genre_list)

    notify
  end

  private
    def notify
      logger.debug("test")
      AutoMatching::SlackUtils.post(message)
    end

    def message
      "hello, world!"
    end
end
