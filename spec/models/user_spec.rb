require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.create(:user)
  end

  it "is valid" do
    @user.valid?
    expect(@user).to be_valid
  end

  it "is invalid without name" do
    @user.name = '  '
    @user.valid?
    expect(@user).to_not be_valid
  end

  it "is invalid without email" do
    @user.email = '  '
    @user.valid?
    expect(@user).to_not be_valid
  end

  it "is invalid with name too long" do
    @user.name = "a"*51
    @user.valid?
    expect(@user).to_not be_valid
  end

  it "is invalid with email too long" do
    @user.email = "a"*244 + "@example.com"
    @user.valid?
    expect(@user).to_not be_valid
  end

  #有効なメールフォーマットをテストする
  it "accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US_ER@foo.bar.org
                  first.last@foo.jp alice+bob@baz.cn] 
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      @user.valid?
      expect(@user).to be_valid,"#{valid_address.inspect} should be valid"
    end
  end

  #メールフォーマットのバリデーションテスト
  it "reject invalid address" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                  foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      @user.valid?
      expect(@user).to_not be_valid,"#{invalid_address.inspect} should be invalid"
    end
  end

  #重複するメールアドレスは登録できないようになっているかテスト(大文字、小文字関係なし)
  it "has unique email address" do
    duplicate_user = @user.dup
    @user.save
    duplicate_user.valid?
    expect(duplicate_user).to_not be_valid
  end

  #メールアドレスが小文字で保存されているかのテスト
  it "has downcase email when email saved" do
    mixed_case_email = "Foo@ExamPle.CoM"
    @user.email = mixed_case_email
    @user.save
    expect(mixed_case_email.downcase).to eq(@user.reload.email)
  end

  #パスワードがblankの時は無効のテスト
  it "doesn't have blank password" do
    @user.password = @user.password_confirmation =" "*6
    @user.valid?
    expect(@user).to_not be_valid
  end

  #パスワードは最低でも８文字以上ではないと無効のテスト
  it "doesn't have password length 7 or less" do
    @user.password = @user.password_confirmation = "a"*7
    @user.valid?
    expect(@user).to_not be_valid
  end

  #ユーザが削除された時に質問も削除される
  it "associcated quesitons be destoryed when it is desoryed" do
    @user.save
    @user.questions.create!(title: "TestTitle",content: "testcontents!!")
    expect{ @user.destroy }.to change{ Question.count}.by(-1)
  end
end
