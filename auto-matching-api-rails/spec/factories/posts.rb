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

FactoryBot.define do
  factory :post do
    prefecture { Gimei.prefecture.kanji }
    city { Gimei.city.kanji }
    address { Gimei.town.kanji }
    sequence(:url) { |n| "http://example#{n}.com" }
    post_at { Time.zone.now }
    category { ["スグ会いたい", "スグじゃないけど", "アブノーマル"].sample }
    title { Faker::Lorem.sentence }
    association :profile
  end
end
