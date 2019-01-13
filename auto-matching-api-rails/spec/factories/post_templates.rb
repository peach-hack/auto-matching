# == Schema Information
#
# Table name: post_templates
#
#  id         :bigint(8)        not null, primary key
#  body       :text             not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :post_templates do
    title do
      "title#{PostTemplate.count}"
    end
    body do
      "body#{PostTemplate.count}"
    end
  end
end
