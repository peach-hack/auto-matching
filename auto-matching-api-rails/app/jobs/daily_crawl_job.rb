class DailyCrawlJob < AutoJob
  def perform(sender_class_s)
    klass = sender_class_s.constantize

    AutoMatching::Reader::Executor.new.run(klass)
  end
end
