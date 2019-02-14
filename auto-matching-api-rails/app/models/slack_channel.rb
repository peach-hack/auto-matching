class SlackChannel < ApplicationRecord
  validates :keyword, presence: false, uniqueness: true
  validates :name, presence: false, uniqueness: true

  belongs_to :slack, optional: true
end
