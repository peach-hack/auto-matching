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
#  prefecture :string           not null
#  title      :string           not null
#  url        :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  profile_id :integer          not null
#

class Post < ApplicationRecord
  validates :title, presence: true
  validates :url, presence: true
  validates :post_at, presence: true
  validates :category, presence: true

  belongs_to :profile, optional: true
end
