# == Schema Information
#
# Table name: slack_channels
#
#  id         :bigint(8)        not null, primary key
#  keyword    :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slack_id   :integer          not null
#

class SlackChannel < ApplicationRecord
  validates :keyword, presence: false, uniqueness: true
  validates :name, presence: false, uniqueness: true

  belongs_to :slack, optional: true
end
