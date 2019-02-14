class SlackWorkspace < ApplicationRecord
  validates :keyword, presence: false, uniqueness: true
  validates :name, presence: false, uniqueness: true

  has_many :slack_channel, dependent: :destroy
end
