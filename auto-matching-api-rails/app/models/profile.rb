# == Schema Information
#
# Table name: profiles
#
#  id         :bigint(8)        not null, primary key
#  age        :integer          not null
#  from       :integer          not null
#  name       :string           not null
#  sex        :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Profile < ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true
  validates :sex, presence: true
  validates :from, presence: true

  has_many :posts, dependent: :destroy
end
