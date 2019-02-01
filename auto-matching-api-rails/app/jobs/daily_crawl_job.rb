class DailyCrawlJob < AutoJob
  def perform(debug_flag, sender_class_s)
    klass = sender_class_s.constantize

    AutoMatching::Reader::Executor.new.run(klass)
  end
end
