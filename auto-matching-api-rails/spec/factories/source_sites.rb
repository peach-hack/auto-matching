# frozen_string_literal: true

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

FactoryBot.define do
  factory :source_site do
    key do
      SourceSite::KEY_HAPPY_MAIL
    end
    name do
      "ハッピーメール"
    end
    login_user do
      "login_user#{SourceSite.count}@gmail.com"
    end
    login_password do
      "login_password#{SourceSite.count}"
    end
    login_url do
      "http://example#{SourceSite.count}.com"
    end
    affiliate_url do
      "http://example#{SourceSite.count}.com"
    end
    activate_flag do
      true
    end
  end
end
