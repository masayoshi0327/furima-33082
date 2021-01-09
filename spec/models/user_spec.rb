require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    it "すべてのデータを正しく入力できていれば登録できる" do
    end
    it "nicknameが存在すれば登録できる" do
    end
    it "nicknameが空だと登録できない" do
    end
    it "emailが正しく書かれていれば登録できる" do
    end
    it "emailが空だと登録できない" do
    end
    it "emailに@が含まれないと登録できない" do
    end
    it "emailはすでに登録されているものは使用できない" do
    end
    it "passwordとpassword_confirmationが6文字以上なら登録できる" do
    end
    it "passwordが空だと登録できない" do
    end
    it "passwordは6文字以上でないと登録できない" do
    end
    it "passwordが英字だけでは登録できない" do
    end
    it "passwordが数字だけでは登録できない" do
    end
    it "passwordとpassword_confirmationは同じでなければならない" do
    end
    it "last_nameが漢字、ひらがな、カタカナのいずれかで書かれていれば登録できる" do
    end
    it "last_nameは空だと登録できない" do
    end
    it "last_nameは漢字、ひらがな、カタカナでないと登録できない" do
    end
    it "first_nameが漢字、ひらがな、カタカナのいずれかで書かれていれば登録できる" do
    end
    it "first_nameは空だと登録できない" do
    end
    it "first_nameは漢字、ひらがな、カタカナでないと登録できない" do
    end
    it "last_furiganaがカタカナで書かれていれば登録できる" do
    end
    it "last_furiganaは空だと登録できない" do
    end
    it "last_furiganaはカタカナでないと登録できない" do
    end
    it "first_furiganaがカタカナで書かれていれば登録できる" do
    end
    it "first_furiganaは空だと登録できない" do
    end
    it "first_furiganaはカタカナでないと登録できない" do
    end
    it "birthdayが存在すれば登録できる" do
    end
    it "birthdayは空では登録できない" do
    end
end
