require 'rails_helper'

RSpec.describe PurchasePurchaseAdmin, type: :model do
  describe '商品購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_purchase_admin = FactoryBot.build(:purchase_purchase_admin, user_id: user.id, item_id: item.id)
      sleep(0.1)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_purchase_admin).to be_valid
      end
      it 'building_nameは空でも保存できる' do
       @purchase_purchase_admin.building_name = ''
        expect(@purchase_purchase_admin).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'tokenが空である' do
       @purchase_purchase_admin.token = ''
        @purchase_purchase_admin.valid?
        expect(@purchase_purchase_admin.errors.full_messages).to include("Token can't be blank")
      end
      it 'phone_numberが空である' do
        @purchase_purchase_admin.phone_number = ''
        @purchase_purchase_admin.valid?
        expect(@purchase_purchase_admin.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
      end
      it 'phone_numberが10桁である' do
        @purchase_purchase_admin.phone_number = '1234567891'
        @purchase_purchase_admin.valid?
        expect(@purchase_purchase_admin.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが12桁である' do
        @purchase_purchase_admin.phone_number = '123456789123'
        @purchase_purchase_admin.valid?
        expect(@purchase_purchase_admin.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが数字意外が混じっている' do
        @purchase_purchase_admin.phone_number = '12345asd912'
        @purchase_purchase_admin.valid?
        expect(@purchase_purchase_admin.errors.full_messages).to include("Phone number is invalid")
      end
      it 'local_addressが空である' do
        @purchase_purchase_admin.local_address = ''
        @purchase_purchase_admin.valid?
        expect(@purchase_purchase_admin.errors.full_messages).to include("Local address can't be blank")
      end
      it 'local_position_townが空である' do
        @purchase_purchase_admin.local_position_town = ''
        @purchase_purchase_admin.valid?
        expect(@purchase_purchase_admin.errors.full_messages).to include("Local position town can't be blank")
      end
      it 'delivery_local_idが選ばれていない' do
        @purchase_purchase_admin.delivery_local_id = '1'
        @purchase_purchase_admin.valid?
        expect(@purchase_purchase_admin.errors.full_messages).to include("Delivery local can't be blank")
      end
      it 'post_numberが空である' do
        @purchase_purchase_admin.post_number = ''
        @purchase_purchase_admin.valid?
        expect(@purchase_purchase_admin.errors.full_messages).to include("Post number can't be blank")
      end
      it 'post_numberにハイフンがない' do
        @purchase_purchase_admin.post_number = '1234567'
        @purchase_purchase_admin.valid?
        expect(@purchase_purchase_admin.errors.full_messages).to include("Post number is invalid")
      end
      it 'post_numberが3-4の形でない' do
        @purchase_purchase_admin.post_number = '1234-567'
        @purchase_purchase_admin.valid?
        expect(@purchase_purchase_admin.errors.full_messages).to include("Post number is invalid")
      end
      it 'post_numberが数字でない' do
        @purchase_purchase_admin.post_number = 'aiu-eoka'
        @purchase_purchase_admin.valid?
        expect(@purchase_purchase_admin.errors.full_messages).to include("Post number is invalid")
      end
    end
  end
end
