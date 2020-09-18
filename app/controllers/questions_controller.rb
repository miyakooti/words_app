class QuestionsController < ApplicationController
  before_action :move_to_index, except: :index
  
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
  
  def index
    # @questions = Question.allこれじゃなくて、、
    #新しいインスタンす創って、、
    question = Question.new(params_question_search)#送信されてきた値を引数
    #引数使って(?)検索かける。この関数はモデルで定義。
    @questions = question.search
  end
  
  def new
    @question = Question.new
  end
  
  def edit
    @question = Question.find(params[:id])
    @button_value = "保存する"

  end
  
  def update
    @question = Question.find(params[:id])
    @question.update(question_params)
    redirect_to root_path, notice:"編集が完了しました！"
  end
  
  def create
    Question.create(quiz: question_params[:quiz], answer: question_params[:answer], user_id: current_user.id)
    #なななんと、フォーム側でuser_id指定しなくてもいい
    redirect_to root_path, notice:"保存が完了しました！"
  end
  
  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to root_path, notice:"削除しました。"
  end
  
  private
  def question_params
    params.require(:question).permit(:quiz, :answer)
  end
  def params_question_search
    params.permit(:search_quiz, :search_answer)
  end
end
