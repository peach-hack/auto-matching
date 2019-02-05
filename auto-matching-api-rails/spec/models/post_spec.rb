require "rails_helper"

RSpec.describe Post, type: :model do
  let(:source_site) { create(:source_site) }
  let(:post_hash) {
    {
      title: "こんにちは",
      url: "https://example.com",
      post_at: Time.zone.now,
      category: "今から",
      prefecture: "東京都",
      city: "町田市",
      address: "中町"
    }
  }
  let(:another_post_hash) {
    {
      title: "こんにちは",
      url: "https://example2.com",
      post_at: Time.zone.now,
      category: "今から",
      prefecture: "東京都",
      city: "町田市",
      address: "中町"
    }
  }
  let(:profile_hash) {
    {
      source_site_id: source_site.id,
      name: "さき",
      age: "２０代前半",
      sex: "女性",
      from: "東京都"
    }
  }
  let(:another_profile_hash) {
    {
      source_site_id: source_site.id,
      name: "ゆり",
      age: "２０代前半",
      sex: "女性",
      from: "東京都"
    }
  }

  describe "#compose" do
    context "正常系" do
      it "新規保存" do
        post = Post.compose(post_hash, profile_hash)
        expect(post).to be_truthy

        expect { post.save }.to change { Post.count }.by(1)
      end

      it "重複Post" do
        Post.compose(post_hash, profile_hash).save!
        post = Post.compose(post_hash, profile_hash)
        expect(post).to be_nil
      end

      it "重複Profile" do
        post = Post.compose(post_hash, profile_hash)
        expect do
          post.save!
        end.to change { Post.count }.by(1)

        another_post = Post.compose(another_post_hash, profile_hash)
        expect do
          another_post.save!
        end.to change { Post.count }.by(1)
      end

      it "重複Profile 2" do
        post = Post.compose(post_hash, profile_hash)
        expect do
          post.save!
        end.to change { Profile.count }.by(1)

        another_post = Post.compose(another_post_hash, profile_hash)
        expect do
          another_post.save!
        end.to change { Profile.count }.by(0)
      end

      it "another新規投稿" do
        Post.compose(post_hash, profile_hash).save!
        Post.compose(another_post_hash, another_profile_hash).save!
        expect(Post.count).to eq(2)
        expect(Profile.count).to eq(2)
      end
    end
  end
end
