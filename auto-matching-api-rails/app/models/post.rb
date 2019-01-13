# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id             :bigint(8)        not null, primary key
#  area           :integer          not null
#  category       :string           not null
#  post_at        :datetime         not null
#  title          :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  profile_id     :bigint(8)
#  source_site_id :integer          not null
#
# Indexes
#
#  index_posts_on_profile_id  (profile_id)
#

class Post < ApplicationRecord
  # validates :profile_id, presence: true #外部キーのためvalidateかけない
  # validates :source_site_id, presence: true #必要なくなった
  validates :title, presence: true
  validates :post_at, presence: true
  validates :category, presence: true
  validates :area, presence: true
  # validates :body, presence: true ##bodyは取得しないため

  belongs_to :profile, optional: true
end
