require "rails_helper"

RSpec.describe Post, type: :model do
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
  let(:profile_hash) {
    {
      name: "さき",
      age: "２０代前半",
      sex: "女性",
      from: "東京都"
    }
  }

  describe "#compose" do
    it "新規保存" do
      post = Post.compose(post_hash, profile_hash)
      expect(post).to be_valid
    end
  end
end
