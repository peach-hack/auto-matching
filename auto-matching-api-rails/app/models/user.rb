# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  password_digest :string
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_username  (username) UNIQUE
#

class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, uniqueness: { case_sensitive: false }

  def self.authenticate(username, password)
    user = User.find_by(username: username)
    user && user.authenticate(password)
  end
end
