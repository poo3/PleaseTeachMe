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

  it "is invalid without title" do
    @question.title = '   '
    expect(@question).to_not be_valid
  end

  it "doesn't have content length 30 or less" do
    @question.title = 'a'*31
    expect(@question).to_not be_valid
  end

  it "doesn't have content length 500 or less" do
    @question.content = 'a'*501
    expect(@question).to_not be_valid
  end

  # 最新のものが一番最初に表示されているか
  context "question order" do
    before do
      @questions = FactoryBot.create_list(:question, 10,user: @user)
    end
    it "should ordered most recent first" do
      expect(@questions[9]).to eq Question.first
    end
  end

end
