class QuestionsController < ApplicationController
  before_action :logged_in_user, only: [:new,:create,:destroy]
  before_action :correct_user,   only: :destroy

  def new
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
  end

  def create
    @question = current_user.questions.build(question_params)
    if @question.save
      flash[:success] = "質問を投稿しました!"
      redirect_to user_path(current_user)
    else
      render 'questions/new'
    end
  end

  def destroy
    @question.destroy
    flash[:success] = "質問を削除しました"
    redirect_to user_path(current_user)
  end

  private

    def question_params
      params.require(:question).permit(:content,:title)
    end

    def correct_user
      @question = current_user.questions.find_by(id: params[:id])
      redirect_to root_url if @question.nil?
    end
end
