class UsersController < ApplicationController
  def show
      #current_user.idと同じuser_idをしているクイズを持ってくる
    question = Question.new(params_question_search)
    @questions = question.search
    
  end
  #これってquestioncontrollerでもできない？っていう疑問が残っています。
  def params_question_search
    params.permit(:search_quiz, :search_answer)
  end
end
