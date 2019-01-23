# == Schema Information
#
# Table name: profiles
#
#  id             :bigint(8)        not null, primary key
#  age            :string           not null
#  from           :string           not null
#  name           :string           not null
#  sex            :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  source_site_id :integer          not null
#

FactoryBot.define do
  factory :profile do
    name { Faker::Name.name }
    age {  [20, 30, 40, 50].sample.to_s + "代" + ["前半", "半ば", "後半"].sample }
    sex { "女性" }
    from { Gimei.prefecture.kanji }
    source_site { SourceSite.offset(rand(SourceSite.count)).first || association(:source_site) }
  end
end
