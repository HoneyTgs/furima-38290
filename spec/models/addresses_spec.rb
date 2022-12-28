require 'rails_helper'

RSpec.describe Addresses, type: :model do
  before do
    @addresses = FactoryBot.build(:addresses)
  end

  describe '商品の購入' do
    context '商品を購入できる場合' do
      it 'postal_code, prefecture_id, city, address, phone_numberが存在すれば購入できる' do
        expect(@addresses).to be_valid
      end  
    end 
     
    context '商品を購入できない場合' do
      it 'postal_codeが空では購入できない' do
        @addresses.postal_code = ''
        @addresses.valid?
        expect(@addresses.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @addresses.postal_code = '1234567'
        @addresses.valid?
        expect(@addresses.errors.full_messages).to include('Postal code is invalid')
      end
      it 'prefecture_idが空では購入できない' do
        @addresses.prefecture_id = ''
        @addresses.valid?
        expect(@addresses.errors.full_messages).to include("Prefecture can't be blank")
      end   
      it '発送先の地域に「---」が選択されている場合は購入できない' do
        @addresses.prefecture_id = '1'
        @addresses.valid?
        expect(@addresses.errors.full_messages).to include("Prefecture can't be blank")
      end 
      it 'cityが空では購入できない' do
        @addresses.city = ''
        @addresses.valid?
        expect(@addresses.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空では購入できない' do
        @addresses.addresses = ''
        @addresses.valid?
        expect(@addresses.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空では購入できない' do
        @addresses.phone_number = ''
        @addresses.valid?
        expect(@addresses.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが10桁未満では購入できない' do
        @addresses.phone_number = '070000000'
        @addresses.valid?
        expect(@addresses.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが12桁以上では購入できない' do
        @addresses.phone_number = '070000000000'
        @addresses.valid?
        expect(@addresses.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      it "tokenが空では登録できないこと" do
        @addresses.token = nil
        @addresses.valid?
        expect(@addresses.errors.full_messages).to include("Token can't be blank")
      end
    end  
  end  
end
