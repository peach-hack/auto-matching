# == Schema Information
#
# Table name: users
#
#  id         :bigint(8)        not null, primary key
#  sub        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  def self.from_token_payload(payload)
    find_by(sub: payload["sub"]) || create!(sub: payload["sub"])
  end
end
