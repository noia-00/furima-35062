require 'rails_helper'

describe Item do
  describe '商品出品' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('app/assets/images/aiueo.png')
    end

    context '商品の出品ができる時' do

      it "必要な情報を適切に入力すると、商品情報がデータベースに保存されること" do
        @item.user = FactoryBot.create(:user)
        expect(@item).to be_valid
      end
    end

    context '商品の出品ができない時' do

      it "商品画像がない場合は出品できないこと" do
        @item.image = []
        @item.valid?
        expect(@item.errors[:images]).to include()
      end

      it "nameがない場合は登録できないこと" do
        @item.user = FactoryBot.create(:user)
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "infoがない場合は登録できないこと" do
        @item.user = FactoryBot.create(:user)
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end

      it "category_idがない場合は登録できないこと" do
        @item.user = FactoryBot.create(:user)
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end

      it "status_idがない場合は登録できないこと" do
        @item.user = FactoryBot.create(:user)
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end

      it "shipping_fee_idがない場合は登録できないこと" do
        @item.user = FactoryBot.create(:user)
        @item.shipping_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end

      it "prefecture_idがない場合は登録できないこと" do
        @item.user = FactoryBot.create(:user)
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end

      it "delivery_schedule_idがない場合は登録できないこと" do
        @item.user = FactoryBot.create(:user)
        @item.delivery_schedule_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end

      it "priceがない場合は登録できないこと" do
        @item.user = FactoryBot.create(:user)
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end

    end
  end
end
