class PostsController < ApplicationController
  before_action :get_post, only: [:update, :edit, :destroy]
  before_action :load_posts, only: :index
  before_action :authenticate_user!, except: [:index, :show]
  load_and_authorize_resource

  def index
    redirect_to root_path if current_user.nil?
  end

  def new
    @post = Post.new
  end

  def show
  end

  def create
    @post = Post.new post_params
    @post.user = current_user
    if @post.save
      redirect_to user_post_path current_user, @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def update
    if params[:post_data][:action].present?
      if params[:post_data][:action] == "approve"
        @post.status = 1
      else
        @post.status = 2
      end
      @post.save
      respond_to do |format|
        format.html
        format.js
      end
    else
      if @post.update post_params
        redirect_to @post
      else
        render :edit
      end
    end
  end

  def edit
  end

  def destroy
    if @post.destroy

    else

    end
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def load_posts
    if current_user.present? && current_user.has_role?(:client) && current_user.has_role?(:admin)
      @posts = Post.all
    elsif current_user.present? && current_user.has_role?(:client)
      @posts = current_user.posts
    else
      @posts = Post.all
    end
  end

  def get_post
    @post = Post.find_by(id: params[:id])
    redirect_to root_path if @post.nil?
  end
end
