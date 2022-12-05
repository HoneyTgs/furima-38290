require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品が出品できる場合' do
      it 'name, description, category_id, item_status_id, shopping_cost_id, prefecture_id, shopping_date_id, price, imageが存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品が出品できない場合' do
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end 
      it 'nameが空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end  
      it 'descriptionが空では出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end  
      it 'category_idが空では出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'カテゴリーに「---」が選択されている場合は出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'item_status_idが空では出品できない' do
        @item.item_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status can't be blank")
      end 
      it '商品の状態に「---」が選択されている場合は出品できない' do
        @item.item_status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status can't be blank")
      end
      it 'shopping_cost_idが空では出品できない' do
        @item.shopping_cost_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shopping cost can't be blank")
      end 
      it '配送料の負担に「---」が選択されている場合は出品できない' do
        @item.shopping_cost_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shopping cost can't be blank")
      end
      it 'prefecture_idが空では出品できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end   
      it '発送元の地域に「---」が選択されている場合は出品できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end 
      it 'shopping_date_idが空では出品できない' do
        @item.shopping_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shopping date can't be blank")
      end 
      it '発送までの日数に「---」が選択されている場合は出品できない' do
        @item.shopping_date_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shopping date can't be blank")
      end 
      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end 
      it "全角文字を含む価格では出品できない" do
        @item.price = '８８８８８'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "販売価格が¥300より少ない時は出品できないこと" do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end 
      it "販売価格が¥9999999より多い時は出品できないこと" do
        @item.price = '10_000_000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be an integer")
      end    
      it 'ユーザーが紐付いていなければ投稿できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end     
    end
  end
end
