class PostSlackJob < AutoJob
  def perform(sender_class_s, area_list = nil, genre_list = nil)
    klass = sender_class_s.constantize
    key = klass.new.source_site_key
    util = AutoMatching::SlackUtils.new(time_now)

    AutoMatching::Reader::Executor.new.run(klass, area_list, genre_list)

    set_success(key)

    util.notify_posts

  rescue StandardError => e
    set_error(key)
    raise e
  end
end
