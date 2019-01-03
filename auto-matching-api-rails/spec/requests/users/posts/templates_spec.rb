require "rails_helper"

RSpec.describe Api::Users::Posts::TemplatesController, type: :request do
  let(:target) { build(:post_templates) }

  describe "#index" do
    subject { get api_users_posts_templates_path }

    before do
      subject
    end

    context "正常系" do
      it "レスポンスステータスが200であること" do
        expect(response).to have_http_status(200)
        expect(json["data"].length).to eq(PostTemplate.count)
      end
    end
  end
end
