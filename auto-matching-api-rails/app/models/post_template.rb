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

class PostTemplate < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
end
