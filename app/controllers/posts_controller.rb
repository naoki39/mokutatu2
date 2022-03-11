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

  private

  def set_post
    @community = Community.find(params[:community_id])
  end

  def post_params
    params.require(:post).permit(:text).merge(user_id: current_user.id,community_id: params[:community_id])
  end
end
