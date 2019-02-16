# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id         :bigint(8)        not null, primary key
#  address    :string
#  category   :string           not null
#  city       :string
#  post_at    :datetime         not null
#  prefecture :string
#  title      :string           not null
#  url        :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  profile_id :integer          not null
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
    profile_obj.posts.build(post_hash)
  end
end
