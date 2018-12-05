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

# PCMAX
SourceSite.seed do |p|
  p.id = 3
  p.key = SourceSite::KEY_PCMAX
  p.name = "PCMAX"
  p.url = "https://pcmax.jp/pcm/index.php"
  p.login_user = ENV["PCMAX_LOGIN_USER"]
  p.login_password = ENV["PCMAX_LOGIN_PASSWORD"]
end

# イクヨクルヨ
SourceSite.seed do |p|
  p.id = 4
  p.key = SourceSite::KEY_IKUKURU
  p.name = "イクヨクルヨ"
  p.url = "https://www.194964.com/registration/login/show_login_tel.html"
  p.login_user = ENV["IKUKURU_LOGIN_USER"]
  p.login_password = ENV["IKUKURU_LOGIN_PASSWORD"]
end

# イクヨクルヨ
SourceSite.seed do |p|
  p.id = 5
  p.key = SourceSite::KEY_MINT
  p.name = "ミントC!Jメール"
  p.url = "https://mintj.com/msm/login"
  p.login_user = ENV["MINT_LOGIN_USER"]
  p.login_password = ENV["MINT_LOGIN_PASSWORD"]
end
