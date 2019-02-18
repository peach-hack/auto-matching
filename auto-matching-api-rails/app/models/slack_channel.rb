# == Schema Information
#
# Table name: slack_channels
#
#  id                  :bigint(8)        not null, primary key
#  keyword             :string
#  name                :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  slack_workspace^_id :integer          not null
#

class SlackChannel < ApplicationRecord
  validates :keyword, presence: false, uniqueness: true
  validates :name, presence: false, uniqueness: true

  belongs_to :slack_workspace, optional: true
end
