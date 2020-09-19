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
    @main_title = "新規作成"
    @button_value = "投稿する"
    # @main_img_path = image_path("thought-amico.png") image_pathはview側でしか使えないらしい、、残念
    @pushed_path_new = params[:pushed_path_index]#新規作成おした時点のリンク
  end
  
  def edit
    @question = Question.find(params[:id])
    @main_title = "編集"
    @button_value = "更新する"
    # @main_img_path = image_path("edit-amico.png")

  end
  
  def update
    @question = Question.find(params[:id])
    @question.update(question_params)
    redirect_to root_path, notice:"編集が完了しました！"
  end
  
  def create
    Question.create(quiz: question_params[:quiz], answer: question_params[:answer], user_id: current_user.id)
    #なななんと、フォーム側でuser_id指定しなくてもいい
    
    #一覧にいたときは一覧に、マイページにいたときはマイページに遷移するロジック
    if params[:pushed_path_new].include?('user')#新規作成おした時点のリンクにuserがあるとき
      redirect_to user_path(current_user.id), notice:"投稿が完了しました！"
    else
      redirect_to root_path, notice:"投稿が完了しました！"
    end
  end
  
  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to user_path(current_user.id), notice:"削除しました。"
  end
  
  private
  def question_params
    params.require(:question).permit(:quiz, :answer)
  end
  def params_question_search
    params.permit(:search_quiz, :search_answer)
  end
end
