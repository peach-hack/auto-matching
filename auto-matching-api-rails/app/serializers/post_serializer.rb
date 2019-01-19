class PostSerializer < ApplicationSerializer
  attributes :id, :title, :post_at, :category, :prefecture, :city, :address
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
      name: object.profile.source_site.name,
      url: object.profile.source_site.affiliate_url,
    }
  end
end
