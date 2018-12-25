# frozen_string_literal: true

# == Schema Information
#
# Table name: source_sites
#
#  id                          :bigint(8)        not null, primary key
#  is_crawl(クロール対象かどうか)        :boolean          default(TRUE), not null
#  key(ユニークキー)                 :string(255)      not null
#  password(ログインパスワード情報) :string(255)      not null
#  user_id(ログインユーザー情報)      :string(255)      not null
#  name(サイト名)                  :string(255)      not null
#  url(サイトURL)                 :string(255)      not null
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#
# Indexes
#
#  index_source_sites_on_key  (key) UNIQUE
#

FactoryBot.define do
  factory :source_site do
    key do
      "key#{SourceSite.count}"
    end
    user_id do
      "user_id#{SourceSite.count}@gmail.com"
    end
    password do
      "password#{SourceSite.count}"
    end
    name do
      "name#{SourceSite.count}"
    end
    login_url do
      "http://example#{SourceSite.count}.com"
    end
    url do
      "http://example#{SourceSite.count}.com"
    end
    activate_flag { true }
  end
end
