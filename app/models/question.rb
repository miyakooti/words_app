class Question < ApplicationRecord
    belongs_to :user
    attr_accessor :search_quiz, :search_answer #フォームからの値をオブジェクトの属性に格納する
    def search
    #絞り込むイメージ！
    Question.ransack(quiz_cont: @search_quiz, answer_cont: @search_answer).result
    end
end
