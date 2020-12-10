require 'rails_helper'

RSpec.describe Contact, type: :model do
  before do
    @contact = Contact.new(name:"Example User",email:"user@example.com",
                  content: "testだよー"*20)
  end

  # デフォルトテスト情報が有効かどうか
  it "is valid" do
    @contact.valid?
    expect(@contact).to be_valid
  end
  # 名無さん
  it "is invalid without name" do
    @contact.name = '  '
    @contact.valid?
    expect(@contact).to_not be_valid
  end

  it "is invalid without email" do
    @contact.email = '  '
    @contact.valid?
    expect(@contact).to_not be_valid
  end

  # 名前長すぎる
  it "is invalid with name too long" do
    @contact.name = "a"*51
    @contact.valid?
    expect(@contact).to_not be_valid
  end

  # メールアドレス長すぎる
  it "is invalid with email too long" do
    @contact.email = "a"*244 + "@example.com"
    @contact.valid?
    expect(@contact).to_not be_valid
  end

  #有効なメールフォーマットをテストする
  it "accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US_ER@foo.bar.org
                  first.last@foo.jp alice+bob@baz.cn] 
    valid_addresses.each do |valid_address|
      @contact.email = valid_address
      @contact.valid?
      expect(@contact).to be_valid,"#{valid_address.inspect} should be valid"
    end
  end

  #メールフォーマットのバリデーションテスト
  it "reject invalid address" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                  foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @contact.email = invalid_address
      @contact.valid?
      expect(@contact).to_not be_valid,"#{invalid_address.inspect} should be invalid"
    end
  end

  #メールアドレスが小文字で保存されているかのテスト
  it "has downcase email when email saved" do
    mixed_case_email = "Foo@ExamPle.CoM"
    @contact.email = mixed_case_email
    @contact.save
    expect(mixed_case_email.downcase).to eq(@contact.reload.email)
  end

  #お問い合わせ内容がblankの時は無効のテスト
  it "doesn't have blank content" do
    @contact.content = "      "*3
    @contact.valid?
    expect(@contact).to_not be_valid
  end

  #お問い合わせ内容が500文字を超える時
  it "doesn't have content length over 500" do
    @contact.content = "a"*501
    @contact.valid?
    expect(@contact).to_not be_valid
  end

end
