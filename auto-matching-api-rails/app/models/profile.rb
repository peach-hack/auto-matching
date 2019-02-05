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

class Profile < ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true
  validates :sex, presence: true
  validates :from, presence: false

  belongs_to :source_site
  has_one :post, dependent: :destroy
  accepts_nested_attributes_for :post

  def prepare(source_site_id, name, age, sex, from)
    profile = {}
    profile[:source_site_id] = source_site_id
    profile[:name] = name
    profile[:age] = age
    profile[:sex] = sex
    profile[:from] = from
    profile
  end
end
