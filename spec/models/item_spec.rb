require 'rails_helper'

describe User do
  before do
    @item = FactoryBot.build(:item)
    sleep(0.1)
  end

  describe '商品出品機能'do
    context '商品出品が上手く行く時' do
      it '正しく入力する' do
        expect(@item).to be_valid
        end
      it '販売価格が¥300~¥9,999,999まで' do
        @item.price = 300
        expect(@item).to be_valid
        end
    end

    context '商品出品が上手くいかない時' do
      it '商品名が書かれていない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が書かれていない' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
      it 'カテゴリーが空白である' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態が空白である' do
        @item.appearance_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Appearance can't be blank")
      end
      it '発送元の地域が空白である' do
        @item.delivery_local_id = 1
        @item.save
        expect(@item.errors.full_messages).to include("Delivery local can't be blank")
      end
      it '発送までの日数が空白である' do
        @item.delivery_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery date can't be blank")
      end
      it '価格が空白である' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が¥300未満である' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it '価格が¥10,000,000以上である' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it '商品画像がついてない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '価格が全角文字では登録できないこと' do
        @item.price = 'あいうえお'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it '価格が半角英語だけでは登録できないこと' do
        @item.price = 'aiueo'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it '価格が半角英数混合では登録できないこと' do
        @item.price = 'a1s2d3'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it 'userが紐付いていない場合は登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end