require "rails_helper"

RSpec.describe Users::SourceSitesController, type: :request do
  let!(:source_sites) { 6.times { create(:source_site) } }

  describe "#index" do
    subject { get users_source_sites_path }

    before do
      subject
    end

    context "正常系" do
      it "レスポンスステータスが200であること" do
        expect(response).to have_http_status(200)
        expect(json.length).to eq(SourceSite.count)
      end
    end
  end
end
