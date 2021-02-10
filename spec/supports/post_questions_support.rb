module PostQuestionsSupport
  def post_question(question)
    fill_in 'question_title', with: question.title
    fill_in 'question_content', with: question.content
    click_button '投稿'
  end
end