class ManualPostJob < ApplicationJob
  queue_as :default

  def perform(debug_flag, sender_class_s)
    $DEBUG = debug_flag
    AutoMatching::Sender::Executor.new.run(sender_class_s.constantize)
    $DEBUG = false
  end
end
