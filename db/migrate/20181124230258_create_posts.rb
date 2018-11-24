class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts, comment: "掲示板投稿データ" do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.datetime :published_at, comment: "投稿日時"

      t.timestamps
    end

    add_index :posts, :published_at
  end
end
