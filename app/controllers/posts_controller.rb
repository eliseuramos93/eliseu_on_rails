class PostsController < ApplicationController
  before_action :require_admin_role, except: [:index, :show]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find[:id]
    @post.destroy

    redirect_to root_path, status: :see_other
  end

  private

    def post_params
      params.require(:post).permit(:title, :body, :author_id)
    end

    def require_admin_role
      unless current_user.try(:admin?)
        flash[:failure] = "You are not authorized to create new or edit exisiting posts"
        redirect_to root_path
      end
      
      true
    end
end
