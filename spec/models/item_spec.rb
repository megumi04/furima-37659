require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品登録' do
    context '商品登録できる時' do
      it 'image,name,price,item_text,category,shopping_cost,state,shopping_day,status,userが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品登録できない時' do
      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'item_textが空だと登録できない' do
        @item.item_text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item text can't be blank")
      end
      it 'category_idが---だと登録できない' do
        @item.category_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'status_idが---だと登録できない' do
        @item.status_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it 'shopping_cost_idが---だと登録できない' do
        @item.shopping_cost_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shopping cost can't be blank")
      end
      it 'state_idが---だと登録できない' do
        @item.state_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("State can't be blank")
      end
      it 'shopping_day_idが---だと登録できない' do
        @item.shopping_day_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shopping day can't be blank")
      end
      it 'priceが空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが300未満だと登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceが10000000以上だと登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it 'priceが全角の数字だと登録できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceが小数点を含む数字だと登録できない' do
        @item.price = '300.1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be an integer')
      end
      it 'ユーザー情報がない場合は登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
