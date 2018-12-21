require "rails_helper"

RSpec.describe Api::Users::SourceSitesController, type: :request do
  let!(:source_sites) { 6.times { create(:source_site) } }
  let(:target) { create(:source_site) }

  describe "#index" do
    subject { get api_users_source_sites_path }

    before do
      subject
    end

    context "正常系" do
      it "レスポンスステータスが200であること" do
        expect(response).to have_http_status(200)
        expect(json["data"].length).to eq(SourceSite.count)
      end
    end
  end

  describe "#update" do
    let(:params) { {} }
    subject { put api_users_source_site_path(target), params: params }

    before do
      subject
    end

    context "正常系" do
      context "空パラメータの場合" do
        it "レスポンスステータスが200であること" do
          expect(response).to have_http_status(200)
        end

        it "空パラメータでクリアされていること" do
          source_site = SourceSite.find(target.id)
          expect(source_site.login_user).to be_blank
          expect(source_site.login_password).to be_blank
        end
      end

      context "パラメータありの場合" do
        let(:params) { { login_user: "tsu-nera", login_password: "tsu-nera" } }

        it "レスポンスステータスが200であること" do
          expect(response).to have_http_status(200)
        end

        it "空パラメータでクリアされていること" do
          source_site = SourceSite.find(target.id)
          expect(source_site.login_user).to eq(params[:login_user])
          expect(source_site.login_password).to eq(params[:login_password])
        end
      end
    end
  end
end
