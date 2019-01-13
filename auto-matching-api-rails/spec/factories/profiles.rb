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
    name { "MyString" }
    age { 1 }
    sex { 1 }
    from { 1 }
  end
end
