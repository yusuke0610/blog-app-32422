require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    context '新規登録が上手くいく時' do

      it 'email.password.password_confirmation.nameが存在するとき登録できる' do
        expect(@user).to be_valid
      end

    end

    context '新規登録が上手くいかない時' do

      it 'nameが空' do
        @user.name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end

      it 'emailが空' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailが一意性がない'do
       @user.save
       another_user = FactoryBot.build(:user, email: @user.email)
       another_user.valid?
       expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it 'emailに＠が含まれない' do
         @user.email = "aaaaa"
         @user.valid?
         expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it 'passwordが空' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank","Password is too short (minimum is 6 characters)","Password is invalid","Password confirmation doesn't match Password")
      end

      it 'passwordとpassword_confiramationが一致していない時' do
        @user.password = "a12345"
        @user.password_confirmation = "a123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが半角英字のみ' do
        @user.password = "aaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is invalid")
      end

      it 'passwordが半角数字のみ' do
        @user.password = "1111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password","Password is invalid")
      end

      it 'passwordが全角英字' do
        @user.password = "AAAAAAA"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password","Password is invalid")
      end

      it 'passwordが全角数字' do
        @user.password = "１１１１１１１"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password","Password is invalid")
      end

    end

  end
  
end
