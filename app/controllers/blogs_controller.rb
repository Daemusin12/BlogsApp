class BlogsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_blog, only: [:show, :destroy]
    before_action :check_admin_role, only: [:destroy]
    
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

    def destroy
      @blog.destroy
      redirect_to blogs_path, notice: 'Blog was successfully deleted.'
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

    def check_admin_role
      redirect_to root_path, alert: 'You are not authorized to perform this action.' unless current_user&.admin?
    end

end
