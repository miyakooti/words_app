class UsersController < ApplicationController
  def show
      #current_user.idと同じuser_idをしているクイズを持ってくる
    @user = User.find(current_user.id)
  end
  #これってquestioncontrollerでもできない？っていう疑問が残っています。
end
