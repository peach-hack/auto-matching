# frozen_string_literal: true

# ハッピーメール
SourceSite::Seeder.seed!(
  SourceSite::KEY_HAPPY_MAIL,
    name: "ハッピーメール",
    url: "https://happymail.co.jp/sp/loginform.php?Log=newspi",
    login_user: ENV["HAPPY_MAIL_LOGIN_USER"],
    login_password: ENV["HAPPY_MAIL_LOGIN_PASSWORD"],
)
