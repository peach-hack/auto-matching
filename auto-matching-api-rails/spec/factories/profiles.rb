# == Schema Information
#
# Table name: profiles
#
#  id             :bigint(8)        not null, primary key
#  age            :integer          not null
#  from           :integer          not null
#  name           :string           not null
#  sex            :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  source_site_id :integer          not null
#

FactoryBot.define do
  factory :profile do
    name { Faker::Name.name }
    age {  [*(20..40)].sample }
    sex { 1 }
    from {  [*(1..49)].sample }
    source_site { SourceSite.offset(rand(SourceSite.count)).first || association(:source_site) }
  end
end
