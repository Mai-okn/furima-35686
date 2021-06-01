require 'rails_helper'

RSpec.describe TradeAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @trade_address = FactoryBot.build(:trade_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@trade_address).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @trade_address.building= ''
        expect(@trade_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it "tokenが空では登録できないこと" do
        @trade_address.token = ''
        @trade_address.valid?
        expect(@trade_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと保存できないこと' do
        @trade_address.postal_code = ''
        @trade_address.valid?
        expect(@trade_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @trade_address.postal_code = '1234567'
        @trade_address.valid?
        expect(@trade_address.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'prefectured_idを選択していないと保存できないこと' do
        @trade_address.prefectured_id = ''
        @trade_address.valid?
        expect(@trade_address.errors.full_messages).to include("Prefectured can't be blank")
      end
      it 'prefectured_idが１の場合は保存できないこと' do
        @trade_address.prefectured_id = '1'
        @trade_address.valid?
        expect(@trade_address.errors.full_messages).to include("Prefectured can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @trade_address.city = ''
        @trade_address.valid?
        expect(@trade_address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @trade_address.address = ''
        @trade_address.valid?
        expect(@trade_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @trade_address.phone_number = ''
        @trade_address.valid?
        expect(@trade_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが10桁未満だと登録できない' do
        @trade_address.phone_number = '111222333'
        @trade_address.valid?
        expect(@trade_address.errors.full_messages).to include("Phone number is too short")
      end
      it 'phone_numberが12桁以上だと登録できない' do
        @trade_address.phone_number = '111222333444'
        @trade_address.valid?
        expect(@trade_address.errors.full_messages).to include("Phone number is too short")
      end
      it 'phone_numberが英数混合だと登録できない' do
        @trade_address.phone_number = 'aaa1111aaaa'
        @trade_address.valid?
        expect(@trade_address.errors.full_messages).to include("Phone number is too short")
      end
      it 'user_idと紐づいていないと登録できない' do
        @trade_address.user_id = nil
        @trade_address.valid?
        expect(@trade_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idと紐づいていないと登録できない' do
        @trade_address.item_id = nil
        @trade_address.valid?
        expect(@trade_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
