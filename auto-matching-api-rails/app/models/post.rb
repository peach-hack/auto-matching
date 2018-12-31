# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id             :bigint(8)        not null, primary key
#  area           :integer          not null
#  body           :text             not null
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
  validates :body, presence: true
end
