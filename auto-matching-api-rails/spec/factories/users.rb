# == Schema Information
#
# Table name: users
#
#  id         :bigint(8)        not null, primary key
#  sub        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :user do
    sub { "MyString" }
  end
end
