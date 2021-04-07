require 'rails_helper'

describe User do
  describe '新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context 'ユーザー登録ができる時' do
      it '全ての項目の入力が存在すれば登録できること' do
        expect(@user).to be_valid
      end

      it 'passwordが6文字以上であれば登録できること' do
        @user.password = 'abc123'
        @user.password_confirmation = 'abc123'
        expect(@user).to be_valid
      end
    end

    context 'ユーザー登録ができない時' do
      it 'nicknameがない場合は登録できないこと' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailがない場合は登録できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'passwordがない場合は登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'password（確認用）がない場合は登録できないこと' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'lastnameがない場合は登録できないこと' do
        @user.lastname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname can't be blank")
      end

      it 'firstnameがない場合は登録できないこと' do
        @user.firstname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname can't be blank")
      end

      it 'lastname_kanaがない場合は登録できないこと' do
        @user.lastname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kana can't be blank", 'Lastname kana is invalid')
      end

      it 'firstname_kanaがない場合は登録できないこと' do
        @user.firstname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana can't be blank", 'Firstname kana is invalid')
      end

      it 'birthdayがない場合は登録できないこと' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      it '重複したemailが存在する場合は登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailに@がないと登録できない' do
        @user.email = 'samplegmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが5文字以下では登録できないこと' do
        @user.password = 'abc12'
        @user.password_confirmation = 'abc12'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが半角英字のみでは登録できないこと' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordが全角では登録できないこと' do
        @user.password = 'あかさたなは'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordが存在してもencrypted_passwordがない場合は登録できないこと' do
        @user.encrypted_password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include
      end

      it 'passwordとpassword_confirmationが不一致では登録できないこと' do
        @user.password = 'abc123'
        @user.password_confirmation = '123abc'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが半角英数字混合でなければ登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'lastnameが全角入力でなければ登録できないこと' do
        @user.lastname = 'ｱｲｳｴｵ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Lastname is invalid')
      end

      it 'firstnameが全角入力でなければ登録できないこと' do
        @user.firstname = 'ｱｲｳｴｵ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname is invalid')
      end

      it 'lastname_kanaが全角カタカナでなければ登録できないこと' do
        @user.lastname_kana = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include('Lastname kana is invalid')
      end

      it 'firstname_kanaが全角カタカナでなければ登録できないこと' do
        @user.firstname_kana = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname kana is invalid')
      end
    end
  end
end
