require 'rails_helper'

RSpec.describe User, type: :model do
   describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない"do
    user = User.new(nickname: "", email: "", password: "", password_confirmation: "",first_name: "", last_name:"",first_name_kana:"",last_name_kana:"",birthday:"")
    end
    it "メールアドレスが空だと登録できない"do
    user = User.new(nickname: "", email: "", password: "", password_confirmation: "",first_name: "", last_name:"",first_name_kana:"",last_name_kana:"",birthday:"")
    end
    it "パスワードが空だと登録できない"do
    user = User.new(nickname: "", email: "", password: "", password_confirmation: "",first_name: "", last_name:"",first_name_kana:"",last_name_kana:"",birthday:"")
    end
    it "パスワードが５文字以下だと登録できない"do
    user = User.new(nickname: "", email: "", password: "", password_confirmation: "",first_name: "", last_name:"",first_name_kana:"",last_name_kana:"",birthday:"")
    end
    it "パスワードが英語のみでは登録できない"do
    user = User.new(nickname: "", email: "", password: "", password_confirmation: "",first_name: "", last_name:"",first_name_kana:"",last_name_kana:"",birthday:"")
   end
    it "パスワードが数字のみでは登録できない"do
    user = User.new(nickname: "", email: "", password: "", password_confirmation: "",first_name: "", last_name:"",first_name_kana:"",last_name_kana:"",birthday:"")
    end
    it "パスワード(確認)が空だと登録できない"do
    user = User.new(nickname: "", email: "", password: "", password_confirmation: "",first_name: "", last_name:"",first_name_kana:"",last_name_kana:"",birthday:"")
    end
    it "パスワード(確認)がパスワードと違ってたら登録できない"do
    user = User.new(nickname: "", email: "", password: "", password_confirmation: "",first_name: "", last_name:"",first_name_kana:"",last_name_kana:"",birthday:"")
    end
    it "名前が空だと登録できない"do
    user = User.new(nickname: "", email: "", password: "", password_confirmation: "",first_name: "", last_name:"",first_name_kana:"",last_name_kana:"",birthday:"")
    end
    it "名前が数字だと登録できない"do
    user = User.new(nickname: "", email: "", password: "", password_confirmation: "",first_name: "", last_name:"",first_name_kana:"",last_name_kana:"",birthday:"")
    end
    it "名前が半角だと登録できない"do
    user = User.new(nickname: "", email: "", password: "", password_confirmation: "",first_name: "", last_name:"",first_name_kana:"",last_name_kana:"",birthday:"")
    end
    it "名前(カナ)が空だと登録できない"do
    user = User.new(nickname: "", email: "", password: "", password_confirmation: "",first_name: "", last_name:"",first_name_kana:"",last_name_kana:"",birthday:"")
    end
    it "名前(カナ)が数字だと登録できない"do
    user = User.new(nickname: "", email: "", password: "", password_confirmation: "",first_name: "", last_name:"",first_name_kana:"",last_name_kana:"",birthday:"")
    end
    it "名前(カナ)が半角だと登録できない"do
    user = User.new(nickname: "", email: "", password: "", password_confirmation: "",first_name: "", last_name:"",first_name_kana:"",last_name_kana:"",birthday:"")
    end
    it "名前(カナ)が全角漢字だと登録できない"do
    user = User.new(nickname: "", email: "", password: "", password_confirmation: "",first_name: "", last_name:"",first_name_kana:"",last_name_kana:"",birthday:"")
    end
    it "名前(カナ)が全角ひらがなだと登録できない"do
    user = User.new(nickname: "", email: "", password: "", password_confirmation: "",first_name: "", last_name:"",first_name_kana:"",last_name_kana:"",birthday:"")
    end
    it "生年月日が空だと登録できない"do
    user = User.new(nickname: "", email: "", password: "", password_confirmation: "",first_name: "", last_name:"",first_name_kana:"",last_name_kana:"",birthday:"")
    end
   end
end
