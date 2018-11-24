class Post < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates :released_at, datetime: true
end
