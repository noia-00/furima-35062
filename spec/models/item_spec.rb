require 'rails_helper'

describe Item do
  describe '商品出品' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('app/assets/images/aiueo.png')
    end

    context '商品の出品ができる時' do
      it '必要な情報を適切に入力すると、商品情報がデータベースに保存されること' do
        @item.user = FactoryBot.create(:user)
        expect(@item).to be_valid
      end
    end

    context '商品の出品ができない時' do
      it '商品画像がない場合は出品できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors[:image]).to include
      end

      it 'nameがない場合は登録できないこと' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'infoがない場合は登録できないこと' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end

      it 'category_idが1だと登録できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include
      end

      it 'status_idが1だと登録できないこと' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include
      end

      it 'shipping_fee_idが1だと登録できないこと' do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include
      end

      it 'prefecture_idが1だと登録できないこと' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include
      end

      it 'delivery_schedule_idが1だと登録できないこと' do
        @item.delivery_schedule_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include
      end

      it 'priceがない場合は登録できないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include
      end

      it 'priceが¥300~¥9,999,999の範囲外では登録できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include
      end

      it 'priceが全角では登録できないこと' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include
      end
    end
  end
end
