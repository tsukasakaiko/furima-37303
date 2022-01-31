require 'rails_helper'


RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  it '全て正しく入力されていれば登録出来る' do
    expect(@item).to be_valid
  end

it 'category_idが1では登録できない' do
  @item.category_id = '1'
  @item.valid?
  expect(@item.errors.full_messages).to include("Category must be other than 1")
end

it 'condition_idが1では登録できない' do
  @item.condition_id = '1'
  @item.valid?
  expect(@item.errors.full_messages).to include("Condition must be other than 1")
end

it 'delivery_charge_idが1では登録できない' do
  @item.delivery_charge_id = '1'
  @item.valid?
  expect(@item.errors.full_messages).to include("Delivery charge must be other than 1")
end

it 'prefecture_idが1では登録できない' do
  @item.prefecture_id = '1'
  @item.valid?
  expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
end

it 'estimated_day_idが1では登録できない' do
  @item.estimated_day_id = '1'
  @item.valid?
  expect(@item.errors.full_messages).to include("Estimated day must be other than 1")
end

it 'priceが空では登録できない' do
  @item.price = ''
  @item.valid?
  expect(@item.errors.full_messages).to include("Price can't be blank")
end


it 'item_infoが空では登録できない' do
  @item.item_info = ''
  @item.valid?
  expect(@item.errors.full_messages).to include("Item info can't be blank")
end


it 'item_nameが空では登録できない' do
  @item.item_name = ''
  @item.valid?
  expect(@item.errors.full_messages).to include("Item name can't be blank")
end

it 'priceが299円以下では登録できない' do
  @item.price = 200
  @item.valid?
  expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
end


it 'priceが1000000000以上では登録できない' do
  @item.price = 1000000000
  @item.valid?
  expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
end


it 'priceは全角数字では登録できない' do
  @item.price = '３３３'
  @item.valid?
  expect(@item.errors.full_messages).to include("Price is not a number")
end


it 'imageが空では登録できない' do
  @item.image = nil
  @item.valid?
  expect(@item.errors.full_messages).to include("Image can't be blank")
end


it 'userと紐づいていないと登録できない' do
  @item.user = nil
  @item.valid?
  expect(@item.errors.full_messages).to include("User must exist")
end





end















