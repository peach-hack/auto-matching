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

FactoryBot.define do
  factory :post do
    prefecture { Gimei.prefecture.kanji }
    city { Gimei.city.kanji }
    address { Gimei.town.kanji }
    sequence(:url) { |n| "http://example#{n}.com" }
    post_at { Time.zone.now - 1.month }
    category { ["スグ会いたい", "スグじゃないけど", "アブノーマル"].sample }
    title { Faker::Lorem.sentence }
    association :profile
  end
end
