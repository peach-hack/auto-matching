class PostSerializer < ApplicationSerializer
  attributes :id, :title, :post_at, :area, :category
  attribute :profile do | object |
    {
      name: object.profile.name,
      age: object.profile.age,
      sex: object.profile.sex,
      from: object.profile.from
    }
  end
  attribute :source_site do |object|
    {
      key: object.profile.source_site.key
    }
  end
end
