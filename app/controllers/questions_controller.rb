class QuestionsController < ApplicationController
  before_action :logged_in_user, only: [:create,:destroy]

  def create
    @question = correct_user.questions.build(question_params)
    if @question.save
      flash[:success] = "Question created!"
      redirect_to root_url
    else
      render 'users/show'
    end
  end

  def destroy

  end

  private

    def question_params
      params.require(:question).permit(:content,:title)
    end
end
