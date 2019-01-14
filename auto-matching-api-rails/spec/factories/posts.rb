# == Schema Information
#
# Table name: posts
#
#  id         :bigint(8)        not null, primary key
#  area       :integer          not null
#  category   :string           not null
#  post_at    :datetime         not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  profile_id :integer          not null
#

FactoryBot.define do
  factory :post do
    area {  [*(1..49)].sample }
    post_at { Time.zone.now }
    category { [*(1..10)].sample.to_s }
    title { Faker::Lorem.sentence }
    association :profile
  end
end
