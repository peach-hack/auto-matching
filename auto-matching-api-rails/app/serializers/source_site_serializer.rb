# == Schema Information
#
# Table name: source_sites
#
#  id                          :bigint(8)        not null, primary key
#  activate_flag(操作対象)         :boolean          not null
#  key(ユニークキー)                 :string           not null
#  password(ログインパスワード情報) :string
#  user_id(ログインユーザー情報)      :string
#  name(サイト名)                  :string           not null
#  public_url(サイトURL)          :string           not null
#  url(クロール開始URL)              :string           not null
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#
# Indexes
#
#  index_source_sites_on_key  (key) UNIQUE
#

class SourceSiteSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :name, :user_id, :password, :url

  attribute :activate_flag do |object|
    if object.activate_flag
      "有効"
    else
      "無効"
    end
  end
end
