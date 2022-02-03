require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order = FactoryBot.build(:order, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '商品購入情報の保存' do
    context '購入情報の保存がうまくいくとき' do
      it '全て正しく入力されていれば登録出来る' do
        expect(@order).to be_valid
      end
      it 'building_nameは空でも登録出来る' do
        @order.building_name = ''
        expect(@order).to be_valid
      end
    end

    context '商品購入機能がうまくいかないとき' do
      it 'post_codeが空だと登録できない' do
        @order.post_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code can't be blank")
      end

      it 'post_codeが半角のハイフンを含んだ正しい形式でないと登録できない' do
        @order.post_code = '1120011'
        @order.valid?
        expect(@order.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end

      it 'prefecture_idが1では登録できない' do
        @order.prefecture_id = '1'
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空では登録できない' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空では登録できない' do
        @order.address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end

      it 'phoneが空では登録できない' do
        @order.phone = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone can't be blank")
      end

      it 'phoneにハイフンを含むと登録できない' do
        @order.phone = '090-1234-5678'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone is invalid')
      end

      it 'phoneが9桁以下ではでは登録できない' do
        @order.phone = '090123456'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone is invalid')
      end

      it 'phoneが12桁以上では登録できない' do
        @order.phone = '090123456789'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone is invalid')
      end

      it 'tokenが空だと保存できないこと' do
        @order.token = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end

      it 'userと紐づいていないと登録できない' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end

      it 'itemと紐づいていないと登録できない' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
