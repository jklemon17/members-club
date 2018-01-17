class PostsController < ApplicationController
  before_action :set_user

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to(@post)
    else
      render 'new'
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def edit
  end
  def update
  end
  def index
    @posts = Post.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
  end
  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :title, :content)
  end

  def set_user
    @user = current_user
  end
end
