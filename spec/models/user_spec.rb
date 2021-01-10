require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    it 'すべてのデータを正しく入力できていれば登録できる' do
      expect(@user).to be_valid
    end
    it 'nicknameが存在すれば登録できる' do
      @user.nickname = 'aaa'
      expect(@user).to be_valid
    end
    it 'nicknameが空だと登録できない' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが正しく書かれていれば登録できる' do
      @user.email = 'aaa@bbb.com'
      expect(@user).to be_valid
    end
    it 'emailが空だと登録できない' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'emailに@が含まれないと登録できない' do
      @user.email = 'aaabbb.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'emailはすでに登録されているものは使用できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'passwordとpassword_confirmationが6文字以上の英字と数字なら登録できる' do
      @user.password = 'abc123'
      @user.password_confirmation = @user.password
      expect(@user).to be_valid
    end
    it 'passwordが空だと登録できない' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordは6文字以上でないと登録できない' do
      @user.password = 'abc12'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordが英字だけでは登録できない' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'passwordが数字だけでは登録できない' do
      @user.password = '123456'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'passwordとpassword_confirmationは同じでなければならない' do
      @user.password = 'aaa123'
      @user.password_confirmation = 'bbb123'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'last_nameが漢字、ひらがな、カタカナのいずれかで書かれていれば登録できる' do
      @user.last_name = '澤さキ'
      expect(@user).to be_valid
    end
    it 'last_nameは空だと登録できない' do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'last_nameは漢字、ひらがな、カタカナでないと登録できない' do
      @user.last_name = 'sawasaki'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name is invalid')
    end
    it 'first_nameが漢字、ひらがな、カタカナのいずれかで書かれていれば登録できる' do
      @user.first_name = '正よシ'
      expect(@user).to be_valid
    end
    it 'first_nameは空だと登録できない' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'first_nameは漢字、ひらがな、カタカナでないと登録できない' do
      @user.first_name = 'masayoshi'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
    end
    it 'last_furiganaがカタカナで書かれていれば登録できる' do
      @user.last_furigana = 'サワサキ'
      expect(@user).to be_valid
    end
    it 'last_furiganaは空だと登録できない' do
      @user.last_furigana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last furigana can't be blank")
    end
    it 'last_furiganaはカタカナでないと登録できない' do
      @user.last_furigana = '澤崎'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last furigana is invalid')
    end
    it 'first_furiganaがカタカナで書かれていれば登録できる' do
      @user.last_furigana = 'マサヨシ'
      expect(@user).to be_valid
    end
    it 'first_furiganaは空だと登録できない' do
      @user.first_furigana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First furigana can't be blank")
    end
    it 'first_furiganaはカタカナでないと登録できない' do
      @user.first_furigana = '正佳'
      @user.valid?
      expect(@user.errors.full_messages).to include('First furigana is invalid')
    end
    it 'birthdayが存在すれば登録できる' do
      @user.birthday = 1995 - 0o3 - 27
      expect(@user).to be_valid
    end
    it 'birthdayは空では登録できない' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
