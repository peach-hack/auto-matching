# frozen_string_literal: true

# ハッピーメール
SourceSite.seed do |p|
  p.id = 1
  p.key = SourceSite::KEY_HAPPY_MAIL
  p.name = "ハッピーメール"
  p.url = "https://happymail.co.jp/sp/loginform.php?Log=newspi"
  p.login_user = ENV["HAPPY_MAIL_LOGIN_USER"]
  p.login_password = ENV["HAPPY_MAIL_LOGIN_PASSWORD"]
end

# ワクワクメール
SourceSite.seed do |p|
  p.id = 2
  p.key = SourceSite::KEY_WAKUWAKU
  p.name = "ワクワクメール"
  p.url = "https://login.550909.com/login/"
  p.login_user = ENV["WAKUWAKU_LOGIN_USER"]
  p.login_password = ENV["WAKUWAKU_LOGIN_PASSWORD"]
end
