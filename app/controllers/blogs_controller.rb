class BlogsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_blog, only: [:show]
    
    def index
      @blogs = Blog.includes(:user, :feedbacks).order(created_at: :desc).page(params[:page]).per(5)
      @blog = Blog.new
    end
  
    def show; end

    def create
      @blog = Blog.new(blog_params)
      @blog.user = current_user
      if @blog.save
        redirect_to index
      else
        render json: { errors: @blog.errors.full_messages }
      end
    end
  
    private
  
    def blog_params
      params.require(:blog).permit(:title, :body)
    end
  
    def set_blog
      @blog = Blog.find(params[:id])
      @feedbacks = @blog.feedbacks.includes(:user).order(created_at: :desc).page(params[:page]).per(5)
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path
    end
end
