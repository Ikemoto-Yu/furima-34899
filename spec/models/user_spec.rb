require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
   describe "ユーザー新規登録" do

    context 'ユーザー登録できる時' do
      it 'パスワードが一致すれば登録できる,パスワードが6文字以上の英数字混合であれば登録できる' do
      @user.password = 'ikemotoyu7'
      @user.password_confirmation = 'ikemotoyu7'
      expect(@user).to be_valid
      end
    end

    context 'ユーザー登録できない時' do

    it "nicknameが空だと登録できない"do
    @user.nickname = ''
    @user.valid?
    expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it "メールアドレスが空だと登録できない"do
    @user.email = ''
    @user.valid?
    expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it "パスワードが空だと登録できない"do
    @user.password = ''
    @user.valid?
    expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it "パスワードが５文字以下だと登録できない"do
    @user.password = 'aaaaa'
    @user.valid?
    expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
    end
    it "パスワードが英語のみでは登録できない"do
    @user.password = 'aaaaaa'
    @user.valid?
    expect(@user.errors.full_messages).to include "Password には英字と数字の両方を含めて設定してください"
   end
    it "パスワードが数字のみでは登録できない"do
    @user.password = '111111'
    @user.valid?
    expect(@user.errors.full_messages).to include "Password には英字と数字の両方を含めて設定してください"
    end
    it "パスワード(確認)が空だと登録できない"do
    @user.password = ''
    @user.valid?
    expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it "パスワード(確認)がパスワードと違ってたら登録できない"do
    @user.password = 'ikemotoyu7'
    @user.password_confirmation = 'ikemotoyu6'
    @user.valid?
    expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it "名前が空だと登録できない(前)"do
    @user.first_name = ''
    @user.valid?
    expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it "名前が空だと登録できない(後)"do
    @user.last_name = ''
    @user.valid?
    expect(@user.errors.full_messages).to include "Last name can't be blank"
    end
    it "名前が数字だと登録できない(前)"do
    @user.first_name = '111'
    @user.valid?
    expect(@user.errors.full_messages).to include "First name is invalid"
    end
    it "名前が数字だと登録できない(後)"do
    @user.last_name = '111'
    @user.valid?
    expect(@user.errors.full_messages).to include "Last name is invalid"
    end
    it "名前が半角だと登録できない(前)"do
    @user.first_name = 'yu'
    @user.valid?
    expect(@user.errors.full_messages).to include "First name is invalid"
    end
    it "名前が半角だと登録できない(後)"do
    @user.last_name = 'ikemoto'
    @user.valid?
    expect(@user.errors.full_messages).to include "Last name is invalid"
    end
    it "名前(カナ)が空だと登録できない"do
    @user.first_name_kana = ''
    @user.last_name_kana = ''
    @user.valid?
    expect(@user.errors.full_messages).to include "First name kana can't be blank", "Last name kana can't be blank"
    end
    it "名前(カナ)が数字だと登録できない"do
    @user.first_name_kana = '67'
    @user.last_name_kana = '2345'
    @user.valid?
    expect(@user.errors.full_messages).to include "First name kana is invalid", "Last name kana is invalid"
    end
    it "名前(カナ)が半角だと登録できない"do
    @user.first_name_kana = 'yu'
    @user.last_name_kana = 'ikemoto'
    @user.valid?
    expect(@user.errors.full_messages).to include "First name kana is invalid", "Last name kana is invalid"
    end
    it "名前(カナ)が全角漢字だと登録できない"do
    @user.first_name_kana = '融'
    @user.last_name_kana = '池本'
    @user.valid?
    expect(@user.errors.full_messages).to include "First name kana is invalid", "Last name kana is invalid"
    end
    it "名前(カナ)が全角ひらがなだと登録できない"do
    @user.first_name_kana = 'ゆう'
    @user.last_name_kana = 'いけもと'
    @user.valid?
    expect(@user.errors.full_messages).to include "First name kana is invalid", "Last name kana is invalid"
    end
    it "生年月日が空だと登録できない"do
    @user.birthday = ''
    @user.valid?
    expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end
    it 'emailは@がないと登録できない' do
      @user.email = 'testtest1'
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
    end
    it 'emailは一意性である' do
    @user.save
    another_user = FactoryBot.build(:user)
    another_user.email = @user.email
    another_user.valid?
    expect(another_user.errors.full_messages).to include "Email has already been taken"
    end
   end
   end
end
