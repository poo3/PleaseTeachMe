require 'rails_helper'

RSpec.describe Question, type: :model do

  before do
    @user = FactoryBot.create(:user)
    @question = FactoryBot.create(:question,user: @user) 
  end

  it "is valid" do
    expect(@question).to be_valid
  end

  it "is invalid without user" do
    @question.user_id = nil
    expect(@question).to_not be_valid
  end

  it "is invalid without content" do
    @question.content = '   '
    expect(@question).to_not be_valid
  end

  it "doesn't have content length 500 or less" do
    @question.content = 'a'*501
    expect(@question).to_not be_valid
  end
end
