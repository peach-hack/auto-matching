class DailyCrawlJob < AutoJob
  def perform(sender_class_s, area_list = nil, genre_list = nil)
    klass = sender_class_s.constantize

    AutoMatching::Reader::Executor.new.run(klass, area_list, genre_list)
  end
end
