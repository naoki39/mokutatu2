class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    set_post
    @posts = Post.where(community_id: @community.id)
   end

  def new
    @post = Post.new
    set_post
  end

  def create
    set_post
    @post = Post.new(post_params)
    if @post.save
      redirect_to community_posts_path(@community.id)
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])#ユーザーがどの投稿を選択しているかが格納
    @comment = Comment.new#コメントを保存するための空のインスタンスを生成
    @comments = @post.comments.includes(:user)#投稿に対して紐づいている全てのコメントと、コメントをしたユーザー情報が格納
  end

  def destroy
    set_post#community_idを取得
    @post = Post.find(params[:id])
    if current_user.id == @post.user.id
      @post.destroy 
      redirect_to community_posts_path(@community.id)
    end
  end

  private

  def set_post
    @community = Community.find(params[:community_id])
  end

  def post_params
    params.require(:post).permit(:text).merge(user_id: current_user.id,community_id: params[:community_id])
  end
end
