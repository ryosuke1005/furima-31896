require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  describe '商品購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.build(:item)
      item.save
      @userorder = FactoryBot.build(:user_order, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '商品購入がうまくいくとき' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@userorder).to be_valid
      end
      it 'building_nameが空でも購入できる' do
        @userorder.building_name = nil
        expect(@userorder).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it 'postal_codeが空では購入できない' do
        @userorder.postal_code = ''
        @userorder.valid?
        expect(@userorder.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'postal_codeに-がなければ購入できない' do
        @userorder.postal_code = '1234567'
        @userorder.valid?
        expect(@userorder.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'prefectureが空では購入できない' do
        @userorder.prefecture = ''
        @userorder.valid?
        expect(@userorder.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では購入できない' do
        @userorder.city = ''
        @userorder.valid?
        expect(@userorder.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空では購入できない' do
        @userorder.house_number = ''
        @userorder.valid?
        expect(@userorder.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空では購入できない' do
        @userorder.phone_number = ''
        @userorder.valid?
        expect(@userorder.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが12桁以上だと購入できない' do
        @userorder.phone_number = '123456789012'
        @userorder.valid?
        expect(@userorder.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)", "Phone number Contains hyphen(-)")
      end
      it 'phone_numberに-が存在すると購入できない' do
        @userorder.phone_number = '090-1234-5678'
        @userorder.valid?
        expect(@userorder.errors.full_messages).to include("Phone number Contains hyphen(-)")
      end
    end
  end
end