class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: [:create, :destroy]

  def create#コメントの作成
    set_comment
    @comment = Comment.create(comment_params)
    redirect_to "/posts/#{@post.id}"
  end

  def destroy
    set_comment
    @comment = Comment.find(params[:id])
    if current_user.id == @comment.user.id
      @comment.destroy 
      redirect_to "/posts/#{@post.id}" 
    end
  end

  private

  def set_comment
    @post = Post.find(params[:post_id])#選択されたpostを取得する
  end

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
