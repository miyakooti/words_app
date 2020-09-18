class UsersController < ApplicationController
  def show
      #current_user.idと同じuser_idをしているクイズを持ってくる
    question = Question.new(params_question_search)
    @questions = question.search
    
    # 便利そうだから、current_userも格納してしまおう。
    # マジでcurrent_user便利だな、、超簡単に取得できる、、
    @user = User.find(current_user.id)
    
  end
  #これってquestioncontrollerでもできない？っていう疑問が残っています。
  def params_question_search
    params.permit(:search_quiz, :search_answer)
  end
end
