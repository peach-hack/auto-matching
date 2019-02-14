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
  validates :title, presence: true
  validates :url, presence: true, uniqueness: true
  validates :post_at, presence: true
  validates :category, presence: true

  belongs_to :profile, optional: true

  def self.prepare(**args)
    post = {}
    post[:title] = args[:title]
    post[:url] = args[:url]
    post[:post_at] = args[:post_at]
    post[:category] = args[:category]
    post[:prefecture] = args[:prefecture]
    post[:city] = args[:city]
    post[:address] = args[:address]
    post
  end

  def self.compose(post_hash, profile_hash)
    if Post.where(title: post_hash[:title]).where(category: post_hash[:category]).where(city: post_hash[:city]).count == 1
      return nil
    end

    profile_obj = Profile.find_or_initialize_by(profile_hash)
    profile_obj.build_post(post_hash)
  end
end
