# == Schema Information
#
# Table name: source_sites
#
#  id                          :bigint(8)        not null, primary key
#  activate_flag(操作対象)         :boolean          not null
#  affiliate_url(アフィリエイトURL)   :string           not null
#  key(ユニークキー)                 :string           not null
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

class SourceSite < ApplicationRecord
  class ManualPostHistory < ActiveType::Record[::SourceSite]
  end
end
