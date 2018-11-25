class SourceSite < ApplicationRecord::Main
  HAPPY_MAIL = "happy_mail".freeze

  validates :key, presence: true, uniqueness: true
  validates :name, presence: true
  validates :url, presence: true, url: true
  validates :login_user, presence: true
  validates :login_password, presence: true
end
