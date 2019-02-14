# == Schema Information
#
# Table name: source_sites
#
#  id                            :bigint(8)        not null, primary key
#  activate_flag(操作対象)           :boolean          not null
#  affiliate_url(アフィリエイトURL)     :string           not null
#  key(ユニークキー)                   :string           not null
#  last_post_at(最終投稿時刻)          :datetime
#  last_post_status(最終投稿ステータス)   :string
#  last_search_at(最終検索時刻)        :datetime
#  last_search_status(最終検索ステータス) :string
#  login_password(ログインパスワード情報)   :string
#  login_url(クロール開始URL)          :string           not null
#  login_user(ログインユーザー情報)        :string
#  name(サイト名)                    :string           not null
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#  post_id                       :bigint(8)
#
# Indexes
#
#  index_source_sites_on_key      (key) UNIQUE
#  index_source_sites_on_post_id  (post_id)
#

# == Shema Information
#
# Table name: source_sites
#
#  id                          :bigint(8)        not null, primary key
#  activate_flag(操作対象)         :boolean          not null
#  affiliate_url(アフィリエイトURL)   :string           not null
#  key(ユニークキー)                 :string           not null
#  last_post_at(最終投稿時刻)        :datetime
#  last_post_status(最終投稿ステータス) :string
#  login_password(ログインパスワード情報) :string
#  login_url(クロール開始URL)        :string           not null
#  login_user(ログインユーザー情報)      :string
#  name(サイト名)                  :string           not null
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  post_id                     :bigint(8)
#
# Indexes
#
#  index_source_sites_on_key      (key) UNIQUE
#  index_source_sites_on_post_id  (post_id)
#

FactoryBot.define do
  factory :source_site do
    sequence(:key) do |n|
      sites = ["ハッピーメール", "ワクワクメール", "PCMAX", "イクヨクルヨ", "ミントC!Jメール", "メルパラ"]
      sites[n - 1]
    end
    name { key.freeze }
    sequence(:login_user) { |n| "login_user#{n}@gmail.com" }
    sequence(:login_password) { |n| "Password#{n}" }
    sequence(:login_url) { |n| "http://example#{n}.com" }
    sequence(:affiliate_url) { |n| "http://example#{n}.com" }
    activate_flag { Faker::Boolean.boolean }
  end
end
