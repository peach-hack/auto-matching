class ManualPostJob < ApplicationJob
  queue_as :default

  sender_classes = [
    AutoMatching::Sender::Happymail,
    AutoMatching::Sender::Wakuwaku,
    AutoMatching::Sender::Pcmax,
    AutoMatching::Sender::Ikukuru,
    AutoMatching::Sender::Mint,
    AutoMatching::Sender::Merupara,
  ]

  def perform(site_ids, debug_flag)
    site_ids.each do |id|
      $DEBUG = debug_flag
      AutoMatching::Sender::Executor.new.run(sender_classes[id])
      $DEBUG = false
    end
  end
end
