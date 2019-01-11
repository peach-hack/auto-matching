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

FactoryBot.define do
  factory :post do
  end
end
