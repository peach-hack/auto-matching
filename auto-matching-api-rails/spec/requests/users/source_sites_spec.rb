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
    let(:params) { { user_id: "", password: "", activate_flag: true } }
    subject { put api_users_source_site_path(target), params: params }

    before do
      subject
    end

    context "正常系" do
      context "空パラメータの場合" do
        it "レスポンスコードが200であること" do
          expect(response).to have_http_status(200)
        end

        it "空パラメータでクリアされていること" do
          source_site = SourceSite.find(target.id)
          expect(source_site.user_id).to be_blank
          expect(source_site.password).to be_blank
        end
      end

      context "パラメータありの場合(email)" do
        let(:params) { { user_id: "tsu-nera@gmail.com", password: "tsu-nera", activate_flag: true } }

        it "レスポンスコードが200であること" do
          expect(response).to have_http_status(200)
        end

        it "パラメータが設定されていること" do
          source_site = SourceSite.find(target.id)
          expect(source_site.user_id).to eq(params[:user_id])
          expect(source_site.password).to eq(params[:password])
        end
      end

      context "パラメータありの場合(phone)" do
        let(:params) { { user_id: "08012345678", password: "tsu-nera", activate_flag: true } }

        it "レスポンスコードが200であること" do
          expect(response).to have_http_status(200)
        end

        it "パラメータが設定されていること" do
          source_site = SourceSite.find(target.id)
          expect(source_site.user_id).to eq(params[:user_id])
          expect(source_site.password).to eq(params[:password])
        end
      end
    end

    context "異常系" do
      context "ユーザ名が不正な場合" do
        let(:params) { { user_id: "tsu-nera", password: "tsu-nera", activate_flag: true } }

        it "レスポンスコードが400であること" do
          expect(response).to have_http_status(400)
        end
      end
    end
  end
end
