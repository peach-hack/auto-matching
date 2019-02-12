class PostSlackJob < AutoJob
  def perform(sender_class_s, area_list = nil, genre_list = nil)
    klass = sender_class_s.constantize

    @start_time = time_now

    AutoMatching::Reader::Executor.new.run(klass, area_list, genre_list)

    send
  end

  private

    def send
      # test
    end
end
