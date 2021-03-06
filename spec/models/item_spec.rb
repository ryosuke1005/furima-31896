require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '商品出品' do
      context '商品出品がうまくいくとき' do
        it '全ての値が正しく入力されていれば保存できること' do
          expect(@item).to be_valid
        end
      end

      context '商品出品がうまくいかないとき' do
        it 'nameが空では登録できない' do
          @item.name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end
        it 'explainが空では登録できない' do
          @item.explain = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Explain can't be blank")
        end
        it 'categoryが空では登録できない' do
          @item.category_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank", "Category Select")
        end
        it 'statusが空では登録できない' do
          @item.status_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Status can't be blank", "Status Select")
        end
        it 'postageが空では登録できない' do
          @item.postage_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Postage can't be blank")
        end
        it 'prefectureが空では登録できない' do
          @item.prefecture_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture can't be blank")
        end
        it 'shipping_dateが空では登録できない' do
          @item.shipping_date_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping date can't be blank")
        end
        it 'priceが空では登録できない' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it 'priceの範囲が300より上でないと登録できない' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
        end
        it 'priceの範囲が9,999,999円を超過すると登録できない' do
          @item.price = 10000000
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
        end
        it 'priceが半角数字以外では登録できない' do
          @item.price = 'abc11'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end
        it 'priceが全角文字では登録できない' do
          @item.price = '１２３'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end
        it 'priceは半角英数混合では登録できない' do
          @item.price = 'abc123'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end
        it 'priceは半角英語だけでは登録できない' do
          @item.price = 'abc'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end
        it 'statusに値が選択された時は登録できない' do
          @item.status_id = '0'
          @item.valid?
          expect(@item.errors.full_messages).to include("Status Select")
        end
        it 'postageに値が選択された時は登録できない' do
          @item.postage_id = '0'
          @item.valid?
          expect(@item.errors.full_messages).to include("Postage Select")
        end
        it 'prefectureに値が選択された時は登録できない' do
          @item.prefecture_id = '0'
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture Select")
        end
        it 'shipping_dateに値が選択された時は登録できない' do
          @item.shipping_date_id = '0'
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping date Select")
        end
        it 'categoryに値が選択された時は登録できない' do
          @item.category_id = '0'
          @item.valid?
          expect(@item.errors.full_messages).to include("Category Select")
        end
      end
    end
  end
end
