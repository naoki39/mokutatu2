class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])#アイコンでクリックされたユーザーのレコードが格納されている
    @posts = @user.posts#クリックされたユーザーの投稿一覧が格納されている
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :goal, :second_goal, :to_do, :image)
  end
end
