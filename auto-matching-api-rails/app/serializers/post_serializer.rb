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
