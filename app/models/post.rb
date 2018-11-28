# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id         :bigint(8)        not null, primary key
#  body       :text(65535)      not null
#  title      :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
end
