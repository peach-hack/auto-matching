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
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  profile_id :integer          not null
#

FactoryBot.define do
  factory :post do
    prefecture {  [*(1..49)].sample }
    post_at { Time.zone.now }
    category { [*(1..10)].sample.to_s }
    title { Faker::Lorem.sentence }
    association :profile
  end
end
