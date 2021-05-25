require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do

    it "全ての項目が入力されていたら登録できる" do
      expect(@user).to be_valid
    end

    #空だと登録できない
    it "nicknameが空だと登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it "emailが空では登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it "passwoedが空では登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it "password_confirmationが空では登録できない" do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it "last_nameが空では登録できない" do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end
    it "first_nameが空では登録できない" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it "last_name_kanaが空では登録できない" do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana can't be blank"
    end
    it "first_name_kanaが空では登録できない" do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end
    it "生年月日が空では登録できない" do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end

    #emailのテスト
    it "重複したemailが存在する場合は登録できない" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include "Email has already been taken"
    end
    it "emailは@を含まなければ登録できない" do
    end
    
    #パスワードのテスト
    it "passwordが6文字以上であれば登録できる" do
      @user.password = '12345a'
      @user.password_confirmation = '12345a'
      expect(@user).to be_valid
    end
    it "passwordが5文字以下であれば登録できない" do
      @user.password = '1234a'
      @user.password_confirmation = '1234a'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
    end
    it "pseewordが半角英数混合でないと登録できない" do
    end
    it "passwordとpassword_confirmationが不一致では登録できない" do
      @user.password = '12345a'
      @user.password_confirmation = '123456a'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    #名前のテスト
    it "last_nameが全角でなければ登録できない" do
      @user.last_name = 'ﾔﾏﾀﾞ'
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name には全角文字を使用してください"
    end
    it "first_nameが全角でなければ登録できない" do
      @user.first_name = 'ﾔﾏﾀﾞ'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name には全角文字を使用してください"
    end
    it "last_name_kanaが全角カタカナでなければ登録できない" do
      @user.last_name_kana = 'やまだ'
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana には全角カタカナを使用してください"
    end
    it "first_name_kanaが全角カタカナでなければ登録できない" do
      @user.first_name_kana = 'やまだ'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana には全角カタカナを使用してください"
    end
    
  end
end
