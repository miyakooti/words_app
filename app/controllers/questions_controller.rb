class QuestionsController < ApplicationController
  before_action :move_to_index, except: :index
  
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
  
  def index
    @questions = Question.all
  end
  
  def new
    @question = Question.new
  end
  
  def create
    Question.create(quiz: question_params[:quiz], answer: question_params[:answer], user_id: current_user.id)
    #なななんと、フォーム側でuser_id指定しなくてもいい
    redirect_to root_path
  end
  
  private
  def question_params
    params.require(:question).permit(:quiz, :answer)
  end
end
