require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '出品機能' do
    context '出品成功' do
      it 'すべてのデータを正しく入力できていれば保存できる' do
      end
    end
    context '出品失敗' do
      it '画像が添付されていなければ保存できない' do
      end
      it 'nameが存在しなければ保存できない' do
      end
      it 'nameが41文字以上だと保存できない' do
      end
      it 'descriptionが存在しないと保存できない' do
      end
      it 'descriptionが1001文字以上だと保存できない' do
      end
      it 'category_idが0のときは保存できない' do
      end
      it 'condition_idが0のときは保存できない' do
      end
      it 'delivery_fee_idが0のときは保存できない' do
      end
      it 'sender_idが0のときは保存できない' do
      end
      it 'delivery_days_idが0のときは保存できない' do
      end
      it 'priceが存在しなければ保存できない' do
      end
      it 'priceが299以下のときは保存できない' do
      end
      it 'priceが10000000以上のときは保存できない' do
      end
      it 'priceが小数だと保存できない' do
      end
      it 'userが紐づいていないと保存できない' do
      end
    end
  end
end
