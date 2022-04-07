require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '購入情報と配送先の保存' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@order_address).to be_valid
      end
      it 'apartmentは空でも保存できる' do
        @order_address.apartment = ''
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できない' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できない' do
        @order_address.post_code = '9999999'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post code is invalid')
      end
      it 'state_idが空では保存できない' do
        @order_address.state_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("State must be other than 0")
      end

      it 'cityが空では保存ができない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空では保存できない' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'user_idが紐づいていなければ保存できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが紐づいていなければ保存できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では保存できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'phoneが空では保存できない' do
        @order_address.phone = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone can't be blank")
      end
      it 'phoneが半角ハイフン(-)を含む形では保存できない' do
        @order_address.phone = '999-9999-9999'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone is invalid')
      end
      it '全角数字を含むphoneは保存できない' do
        @order_address.phone = '９９９９９９９９９９９'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone is invalid')
      end
      it 'phoneが9桁以下では保存できない' do
        @order_address.phone = '99999999'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone is invalid')
      end
      it 'phoneは12桁以上では保存できない' do
        @order_address.phone = '999999999999'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone is invalid')
      end
    end
  end
end
