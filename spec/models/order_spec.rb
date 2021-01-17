require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  describe '商品の購入(購入情報の保存)' do
    context "購入成功" do
      it "すべてのデータを正しく入力できていれば保存できる" do
        expect(@order).to be_valid
      end
      it "buildingが空でも保存できる" do
        
      end
    end
    context "購入失敗" do
      it "tokenが空のときは保存できない" do
        
      end
      it "postal_codeが空のときは保存できない" do
        
      end
      it "postal_codeにハイフンが含まれないと保存できない" do
        
      end
      it "prefecture_idが0のときは保存できない" do
        
      end
      it "cityが空のときは保存できない" do
        
      end
      it "house_numberが空のときは保存できない" do
        
      end
      it "phoneが空のときは保存できない" do
        
      end
      it "phoneが12ケタのとき保存できない" do
        
      end
      it "phoneにハイフンが含まれるとき保存できない" do
        
      end
    end
  end
end
