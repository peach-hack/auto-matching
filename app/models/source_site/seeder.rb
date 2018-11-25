# == Schema Information
#
# Table name: source_sites
#
#  id                          :bigint(8)        not null, primary key
#  is_crawl(クロール対象かどうか)        :boolean          default(TRUE), not null
#  key(ユニークキー)                 :string(255)      not null
#  login_password(ログインパスワード情報) :string(255)      not null
#  login_user(ログインユーザー情報)      :string(255)      not null
#  name(サイト名)                  :string(255)      not null
#  url(サイトURL)                 :string(255)      not null
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#
# Indexes
#
#  index_source_sites_on_key  (key) UNIQUE
#

class SourceSite < ApplicationRecord
  class Seeder < ActiveType::Record[SourceSite]
    class << self
      def seed!(key, params)
        resource = SourceSite.find_or_initialize_by(key: key)
        if resource.new_record?
          resource.attributes = params
        else
          params = update_if_blank(resource, params, :name)
          params = update_if_blank(resource, params, :url)
          params = update_if_blank(resource, params, :login_user)
          params = update_if_blank(resource, params, :login_password)
          resource.attributes.merge(params)
        end
        resource.save!
      end

      def update_if_blank(resource, params, key)
        resource.send("#{key}=", params[key]) if resource.send(key).blank?
        params.delete(key)
        params
      end
    end
  end
end
