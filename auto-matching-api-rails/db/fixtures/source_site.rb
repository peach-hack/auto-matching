# frozen_string_literal: true

# ハッピーメール
SourceSite.seed do |p|
  p.id = 1
  p.key = SourceSite::KEY_HAPPY_MAIL
  p.name = "ハッピーメール"
  p.login_url = "https://happymail.co.jp/sp/loginform.php?Log=newspi"
  p.url = "https://happymail.co.jp"
  p.user_id = ENV["HAPPY_MAIL_LOGIN_USER"]
  p.password = ENV["HAPPY_MAIL_LOGIN_PASSWORD"]
end

# ワクワクメール
SourceSite.seed do |p|
  p.id = 2
  p.key = SourceSite::KEY_WAKUWAKU
  p.name = "ワクワクメール"
  p.login_url = "https://login.550909.com/login"
  p.url = "https://550909.com"
  p.user_id = ENV["WAKUWAKU_LOGIN_USER"]
  p.password = ENV["WAKUWAKU_LOGIN_PASSWORD"]
end

# PCMAX
SourceSite.seed do |p|
  p.id = 3
  p.key = SourceSite::KEY_PCMAX
  p.name = "PCMAX"
  p.login_url = "https://pcmax.jp/pcm/index.php"
  p.url = "https://pcmax.jp"
  p.user_id = ENV["PCMAX_LOGIN_USER"]
  p.password = ENV["PCMAX_LOGIN_PASSWORD"]
end

# イクヨクルヨ
SourceSite.seed do |p|
  p.id = 4
  p.key = SourceSite::KEY_IKUKURU
  p.name = "イクヨクルヨ"
  p.login_url = "https://www.194964.com/registration/login/show_login_tel.html"
  p.url = "https://194964.com"
  p.user_id = ENV["IKUKURU_LOGIN_USER"]
  p.password = ENV["IKUKURU_LOGIN_PASSWORD"]
end

# ミントC!Jメール
SourceSite.seed do |p|
  p.id = 5
  p.key = SourceSite::KEY_MINT
  p.name = "ミントC!Jメール"
  p.login_url = "https://mintj.com/msm/login"
  p.url = "https://mintj.com"
  p.user_id = ENV["MINT_LOGIN_USER"]
  p.password = ENV["MINT_LOGIN_PASSWORD"]
end

# メルパラ
SourceSite.seed do |p|
  p.id = 6
  p.key = SourceSite::KEY_MERUPARA
  p.name = "メルパラ"
  p.login_url = "https://meru-para.com/msm/login/"
  p.url = "https://meru-para.com"
  p.user_id = ENV["MERUPARA_LOGIN_USER"]
  p.password = ENV["MERUPARA_LOGIN_PASSWORD"]
end
