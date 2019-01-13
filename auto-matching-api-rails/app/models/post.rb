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
#  profile_id     :string           not null
#  source_site_id :integer          not null
#

class Post < ApplicationRecord
  validates :profile_id, presence: true
  # validates :source_site_id, presence: true #必要なくなった
  validates :title, presence: true
  validates :post_at, presence: true
  validates :category, presence: true
  validates :area, presence: true
  # validates :body, presence: true ##bodyは取得しないため

  belongs_to :profile, optional: true
end
