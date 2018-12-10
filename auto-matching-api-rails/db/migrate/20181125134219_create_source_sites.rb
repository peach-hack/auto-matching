class CreateSourceSites < ActiveRecord::Migration[5.2]
  def change
    create_table :source_sites, comment: "出会い系サイトの情報" do |t|
      t.string :key, null: false, comment: "ユニークキー"
      t.string :name, null: false, comment: "サイト名"
      t.string :url, null: false, comment: "サイトURL"
      t.string :login_user, null: true, comment: "ログインユーザー情報"
      t.string :login_password, null: true, comment: "ログインパスワード情報"
      t.timestamps null: false
    end

    add_index :source_sites, :key, unique: true
  end
end
