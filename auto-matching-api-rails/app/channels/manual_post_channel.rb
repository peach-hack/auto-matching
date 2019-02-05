class SearchChannel < ApplicationCable::Channel
  def subscribed
    stream_from "search_channel"
  end
end
