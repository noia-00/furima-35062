require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '商品購入' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @purchase_address = FactoryBot.build(:purchase_address, user_id: @user.id, item_id: @item.id)
      @item.image = fixture_file_upload('app/assets/images/aiueo.png')
      sleep 0.05
    end
    context '商品の購入記録がされる時' do
      it '必要な情報を適切に入力すると、住所情報がデータベースに保存されること' do
        expect(@purchase_address).to be_valid
      end
      it '建物名がなくても保存できること' do
        @purchase_address.address_line_2 = ''
        expect(@purchase_address).to be_valid
      end
    end
    context '商品の購入記録がされない時' do
      it 'tokenが空では登録できないこと' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
      it '紐づくuserがいないと保存できないこと' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end
      it '紐づくitemがないと保存できないこと' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が空では保存できないこと' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にハイフンがないと保存できないこと' do
        @purchase_address.postal_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postal code is invalid')
      end
      it '都道府県を選択しないと保存できないこと' do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it '市町村の入力がないと保存できないこと' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地の入力がないと保存できないこと' do
        @purchase_address.address_line_1 = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Address line 1 can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号に数値以外があると保存できないこと' do
        @purchase_address.phone_number = '090-1234-5678'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が11桁を超えると保存できないこと' do
        @purchase_address.phone_number = '080111111111'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end
