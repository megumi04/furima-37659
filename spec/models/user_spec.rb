require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録/ユーザー登録' do
    context 'ユーザー情報が登録できる時' do
      it 'nickname/email、password/password_confirmation、last_name/first_name、last_name_kana/first_name_kana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end

      it 'passwordが英数字混合であり、6文字以上であれば登録できる' do
        @user.password = 'aaa111'
        @user.password_confirmation = 'aaa111'
        expect(@user).to be_valid
      end
    end

    context 'ユーザー情報が登録できない場合' do
      it 'ニックネームが必須であること' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'メールアドレスが必須であること' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'メールアドレスが一意性であること' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'メールアドレスは@を含む必要があること' do
        @user.email = 'test.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'パスワードが必須であること' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'パスワードは6文字以上であること' do
        @user.password = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'パスワードは半角英数字混合であること（数字）' do
        @user.password = '222222'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", 'Password is invalid')
      end

      it 'パスワードは半角英数字混合であること（英字のみ）' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", 'Password is invalid')
      end

      it 'パスワードとパスワード(確認用)が一致すること' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordは全角文字を含むものは登録できない' do
        @user.password = 'testtest１'
        @user.password_confirmation = 'testtest１'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
    end
  end
  describe '新規登録/本人情報確認' do
    context '本人情報確認ができる場合' do
      it 'last_nameとfirst_nameが全角（漢字・ひらがな・カタカナ）ならば登録できる' do
        @user.last_name = '山田'
        @user.first_name = '太郎'
        expect(@user).to be_valid
      end

      it 'last_name_kanaとfirst_name_kanaが全角カタカナであれば登録できる' do
        @user.last_name_kana = 'ヤマダ'
        @user.first_name_kana = 'タロウ'
        expect(@user).to be_valid
      end
    end

    context '本人情報確認ができない場合' do
      it '名字と名前がそれぞれ必須であること1' do
        @user.last_name = '山田'
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", 'First name is invalid')
      end

      it '名字と名前がそれぞれ必須であること2' do
        @user.last_name = ''
        @user.first_name = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", 'Last name is invalid')
      end

      it '名前は全角（漢字・ひらがな・カタカナ）で入力させること1' do
        @user.last_name = '山田'
        @user.first_name = '2222'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end

      it '名前は（漢字・ひらがな・カタカナ）で入力させること2' do
        @user.last_name = '2222'
        @user.first_name = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end

      it 'フリガナが、名字と名前でそれぞれ必須であること1' do
        @user.last_name_kana = 'ヤマダ'
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank", 'First name kana is invalid')
      end

      it 'フリガナが、名字と名前でそれぞれ必須であること2' do
        @user.last_name_kana = ''
        @user.first_name_kana = 'タロウ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank", 'Last name kana is invalid')
      end

      it 'ユーザー本名のフリガナは全角（カタカナ）で入力させること1' do
        @user.last_name_kana = '山田'
        @user.first_name_kana = 'タロウ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end

      it 'ユーザー本名のフリガナは全角（カタカナ）で入力させること2' do
        @user.last_name_kana = 'ヤマダ'
        @user.first_name_kana = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end

      it '生年月日が必須であること' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
