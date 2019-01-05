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
