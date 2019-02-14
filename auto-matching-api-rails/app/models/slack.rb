class Slack < ApplicationRecord
  validates :keyword, presence: false, uniqueness: true
  validates :name, presence: false, uniqueness: true
  
end
