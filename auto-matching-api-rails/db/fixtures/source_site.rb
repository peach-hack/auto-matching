# ハッピーメール
SourceSite.seed_once do |p|
  p.id = 1
  p.key = SourceSite::KEY_HAPPY_MAIL
  p.name = "ハッピーメール"
  p.login_url = "https://happymail.co.jp/sp/loginform.php?Log=newspi"
  p.affiliate_url = "https://happymail.co.jp/?af14212217"
  p.login_user = ENV["HAPPY_MAIL_LOGIN_USER"]
  p.login_password = ENV["HAPPY_MAIL_LOGIN_PASSWORD"]
  p.activate_flag = false
end

# ワクワクメール
SourceSite.seed_once do |p|
  p.id = 2
  p.key = SourceSite::KEY_WAKUWAKU
  p.name = "ワクワクメール"
  p.login_url = "https://login.550909.com/login/?ref=top"
  p.affiliate_url = "https://550909.com/?f6858637"
  p.login_user = ENV["WAKUWAKU_LOGIN_USER"]
  p.login_password = ENV["WAKUWAKU_LOGIN_PASSWORD"]
  p.activate_flag = false
end

# PCMAX
SourceSite.seed_once do |p|
  p.id = 3
  p.key = SourceSite::KEY_PCMAX
  p.name = "PCMAX"
  p.login_url = "https://pcmax.jp/pcm/index.php"
  p.affiliate_url = "https://pcmax.jp/lp/?ad_id=rm181904"
  p.login_user = ENV["PCMAX_LOGIN_USER"]
  p.login_password = ENV["PCMAX_LOGIN_PASSWORD"]
  p.activate_flag = false
end

# イクヨクルヨ
SourceSite.seed_once do |p|
  p.id = 4
  p.key = SourceSite::KEY_IKUKURU
  p.name = "イクヨクルヨ"
  p.login_url = "https://www.194964.com/registration/login/show_login_tel.html"
  p.affiliate_url = "https://194964.com/AF1213451"
  p.login_user = ENV["IKUKURU_LOGIN_USER"]
  p.login_password = ENV["IKUKURU_LOGIN_PASSWORD"]
  p.activate_flag = false
end

# ミントC!Jメール
SourceSite.seed_once do |p|
  p.id = 5
  p.key = SourceSite::KEY_MINT
  p.name = "ミントC!Jメール"
  p.login_url = "https://mintj.com/msm/login"
  p.affiliate_url = "https://mintj.com/?mdc=991&afguid=1iojxazbuotgo2d2n8pf4xszii"
  p.login_user = ENV["MINT_LOGIN_USER"]
  p.login_password = ENV["MINT_LOGIN_PASSWORD"]
  p.activate_flag = false
end

# メルパラ
SourceSite.seed_once do |p|
  p.id = 6
  p.key = SourceSite::KEY_MERUPARA
  p.name = "メルパラ"
  p.login_url = "https://meru-para.com/msm/login/"
  p.affiliate_url = "https://meru-para.com/?mdc=991&afguid=1y803u9dpjvt42admh2jxq7tv6"
  p.login_user = ENV["MERUPARA_LOGIN_USER"]
  p.login_password = ENV["MERUPARA_LOGIN_PASSWORD"]
  p.activate_flag = false
end
