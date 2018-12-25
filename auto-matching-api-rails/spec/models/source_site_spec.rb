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

require "rails_helper"

RSpec.describe SourceSite, type: :model do
end
