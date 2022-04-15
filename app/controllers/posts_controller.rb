class PostsController < ApplicationController
  before_action :authenticate_user!

  def index#投稿一覧の表示
    set_post
    @posts = Post.where(community_id: @community.id)
   end

  def new#新規投稿
    @post = Post.new
    set_post
  end

  def create#投稿の新規作成
    set_post
    @post = Post.new(post_params)
    if @post.save
      redirect_to community_posts_path(@community.id)
    else
      render :new
    end
  end

  def show#投稿の詳細
    @post = Post.find(params[:id])#ユーザーがどの投稿を選択しているかが格納
    @comment = Comment.new#コメントを保存するための空のインスタンスを生成
    @comments = @post.comments.includes(:user)#投稿に対して紐づいている全てのコメントと、コメントをしたユーザー情報が格納
  end

  def destroy#投稿の削除
    set_post#community_idを取得
    @post = Post.find(params[:id])#投稿を取得
    if current_user.id == @post.user.id#現在ログイン中ユーザーと投稿主が一致していた場合
      @post.destroy #投稿の削除
      redirect_to community_posts_path(@community.id)#コミュニティページに戻る
    end
  end

  private

  def set_post
    @community = Community.find(params[:community_id])#選択したcommunity_idを取得
  end

  def post_params#パラメーターでuser_idを取得
    params.require(:post).permit(:text).merge(user_id: current_user.id,community_id: params[:community_id])#community_idを取得
  end
end
