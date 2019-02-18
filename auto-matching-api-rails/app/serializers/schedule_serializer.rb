# == Schema Information
#
# Table name: schedules
#
#  id          :bigint(8)        not null, primary key
#  post_cron   :string
#  post_sites  :string
#  watch_cron  :string
#  watch_sites :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class SearchHistorySerializer < ApplicationSerializer
  attributes :id, :post_sites, :watch_sites, :post_corn, :watch_cron
end
