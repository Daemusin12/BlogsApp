class FeedbacksController < ApplicationController
  before_action :authenticate_user!

  def create
    
    @blog = Blog.find(params[:blog_id])
    @feedback = @blog.feedbacks.build(feedback_params)
    @feedback.user = current_user
    @feedback.save
    redirect_to blog_path(@blog)
    # if @feedback.save
    #   redirect_to @blog, notice: 'Feedback added successfully.'
    # else
    #   puts @feedback.errors.full_messages
    # end

  end

  private

  def feedback_params
    params.require(:feedback).permit(:content)
  end

end
