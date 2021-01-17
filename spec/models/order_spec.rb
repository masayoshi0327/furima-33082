require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  describe '商品の購入(購入情報の保存)' do
    context '購入成功' do
      it 'すべてのデータを正しく入力できていれば保存できる' do
        expect(@order).to be_valid
      end
      it 'buildingが空でも保存できる' do
        @order.building = nil
        expect(@order).to be_valid
      end
    end
    context '購入失敗' do
      it 'tokenが空のときは保存できない' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空のときは保存できない' do
        @order.postal_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeにハイフンが含まれないと保存できない' do
        @order.postal_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include('Postal code is invalid')
      end
      it 'prefecture_idが0のときは保存できない' do
        @order.prefecture_id = 0
        @order.valid?
        expect(@order.errors.full_messages).to include('Prefecture must be other than 0')
      end
      it 'cityが空のときは保存できない' do
        @order.city = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空のときは保存できない' do
        @order.house_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("House number can't be blank")
      end
      it 'phoneが空のときは保存できない' do
        @order.phone = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone can't be blank")
      end
      it 'phoneが12ケタのとき保存できない' do
        @order.phone = '012345678912'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone is invalid')
      end
      it 'phoneにハイフンが含まれるとき保存できない' do
        @order.phone = '080-1111-2222'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone is invalid')
      end
      it 'phoneは数字のみでないと保存できない' do
        @order.phone = '0801111aaaa'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone is invalid')
      end
    end
  end
end
