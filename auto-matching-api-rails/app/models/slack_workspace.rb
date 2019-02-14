class SlackWorkspace < ApplicationRecord
  validates :webhook_url, presence: false

  has_many :slack_channel, dependent: :destroy
end
