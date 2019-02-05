class ManualPostChannel < ApplicationCable::Channel
  def subscribed
    stream_from "manual_post_channel"
  end
end
