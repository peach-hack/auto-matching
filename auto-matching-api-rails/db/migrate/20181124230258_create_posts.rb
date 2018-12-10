class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts, comment: "掲示板投稿データ" do |t|
      t.string :title, null: false
      t.text :body, null: false

      t.timestamps
    end
  end
end
