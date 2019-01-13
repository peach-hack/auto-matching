# frozen_string_literal: true
# == Schema Information
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

class SourceSite < ApplicationRecord
  KEY_HAPPY_MAIL = "happy_mail".freeze
  KEY_WAKUWAKU = "wakuwaku".freeze
  KEY_PCMAX = "pcmax".freeze
  KEY_IKUKURU = "ikukuru".freeze
  KEY_MINT = "mint".freeze
  KEY_MERUPARA = "merupara".freeze

  VALID_PHONE_OR_EMAIL_REGEX = /\A(\d{10}$|^\d{11})|([^@\s]+@([^@\s]+\.)+[^@\s]+)\z/

  validates :key, presence: true, uniqueness: true
  validates :name, presence: true
  validates :login_url, presence: true
  validates :affiliate_url, presence: true
  validates :login_user, presense: false, allow_blank: true, format: { with: VALID_PHONE_OR_EMAIL_REGEX }
  validates :login_password, presense: false, allow_blank: true

  attribute :activate_flag, :boolean, default: -> { true }

  has_one :profile, dependent: :destroy
end
