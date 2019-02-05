require "spec_helper"

describe AutoMatching::Converter::Pcmax do
  let(:converter) { AutoMatching::Converter::Pcmax.new }

  describe "#split_value" do
    context "正常系" do
      it "２つのリスト" do
        value_list = ["♀ ねね 20歳", "♂ 太郎 37歳"]
        sex_list, name_list, age_list = converter.split_value(value_list)

        expect(sex_list[0]).to eq("女性")
        expect(name_list[0]).to eq("ねね")
        expect(age_list[0]).to eq("20代前半")

        expect(sex_list[1]).to eq("男性")
        expect(name_list[1]).to eq("太郎")
        expect(age_list[1]).to eq("30代後半")
      end
    end
  end

  describe "split_sex_name_age" do
    context "正常系" do
      it "女性 20代前半がとれること" do
        sex, name, age = converter.split_sex_name_age("♀ ねね 20歳")

        expect(sex).to eq("女性")
        expect(name).to eq("ねね")
        expect(age).to eq("20代前半")
      end

      it "男性 30代後半がとれること" do
        sex, name, age = converter.split_sex_name_age("♂ 太郎 37歳")

        expect(sex).to eq("男性")
        expect(name).to eq("太郎")
        expect(age).to eq("30代後半")
      end
    end
  end
end
