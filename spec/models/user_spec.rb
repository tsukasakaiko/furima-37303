require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  it '全て正しく入力されていれば登録出来る' do
    expect(@user).to be_valid
  end

  it 'nicknameが空では登録できない' do
    @user.nickname = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Nickname can't be blank")
  end

  it 'emailが空では登録できない' do
    @user.email = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Email can't be blank")
  end

  it 'passwordが空では登録できない' do
    @user.password = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Password can't be blank")
  end

  it 'passwordとpassword_confirmationが不一致では登録できない' do
    @user.password_confirmation = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end

  it '重複したemailが存在する場合は登録できない' do
    @user.save
    another_user = FactoryBot.build(:user)
    another_user.email = @user.email
    another_user.valid?
    expect(another_user.errors.full_messages).to include('Email has already been taken')
  end

  it 'emaiは@を含まないと登録できない' do
    @user.email = 'testmail'
    @user.valid?
    expect(@user.errors.full_messages).to include('Email is invalid')
  end

  it 'passwordが5文字以下では登録できない' do
    @user.password = '00000'
    @user.password_confirmation = '00000'
    @user.valid?
    expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
  end

  it 'family_nameは全角でないと登録できない' do
    @user.family_name = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Family name can't be blank")
  end

  it 'farst_nameは全角でないと登録できない' do
    @user.farst_name = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Farst name can't be blank")
  end

  it 'family_name_kanaは全角でないと登録できない' do
    @user.family_name_kana = 'test'
    @user.valid?
    expect(@user.errors.full_messages).to include("Family name kana is invalid")
  end

  it 'farst_name_kanaは全角でないと登録できない' do
    @user.farst_name_kana = 'test'
    @user.valid?
    expect(@user.errors.full_messages).to include("Farst name kana is invalid")
  end

  it 'birth_dayが空では登録できない' do
    @user.birth_day = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Birth day can't be blank")
  end

end
