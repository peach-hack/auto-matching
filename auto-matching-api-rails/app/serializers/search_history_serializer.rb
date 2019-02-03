class SearchHistorySerializer < ApplicationSerializer
  attributes :id, :name, :affiliate_url, :activate_flag, :last_search_at, :last_search_status
end
