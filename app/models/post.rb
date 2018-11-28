# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id                 :bigint(8)        not null, primary key
#  body               :text(65535)      not null
#  published_at(投稿日時) :datetime
#  title              :string(255)      not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_posts_on_published_at  (published_at)
#

class Post < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates :released_at, datetime: true
end
