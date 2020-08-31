class PostsController < ApplicationController
    before_action :find_post, only:[:show]

  def show
   
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @post.categories.build
  end

  def create
    @post = Post.create(post_params)
    if @post.valid?
    redirect_to post_path(@post)
    else 
        render :new
    end
  end

  private
    def find_post
        @post = Post.find(params[:id])
    end

  def post_params
    params.require(:post).permit(:title, :content, category_ids:[], categories_attributes: [:name])
  end


end
