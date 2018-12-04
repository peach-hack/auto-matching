# frozen_string_literal: true

# ハッピーメール
SourceSite.seed do |p|
  p.id = 1
  p.key = SourceSite::KEY_HAPPY_MAIL,
  p.name = "ハッピーメール",
  p.url = "https://happymail.co.jp/sp/loginform.php?Log=newspi",
  p.login_user = ENV["HAPPY_MAIL_LOGIN_USER"],
  p.login_password = ENV["HAPPY_MAIL_LOGIN_PASSWORD"]
end
