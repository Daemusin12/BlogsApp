class FeedbacksController < ApplicationController
  before_action :authenticate_user!

  def create
    
    @blog = Blog.find(params[:blog_id])
    @feedback = @blog.feedbacks.build(feedback_params)
    @feedback.user = current_user

    if @feedback.save
      send_notification_email(@feedback) if current_user.present?
      redirect_to @blog
    else
      puts @feedback.errors.full_messages
    end

  end

  private

  def feedback_params
    params.require(:feedback).permit(:content)
  end

  def send_notification_email(feedback)
    user_email = feedback.user&.email

    if user_email.present?
      FeedbackMailer.new_feedback_notification(feedback).deliver_now
    else
      Rails.logger.warn("User's email is nil. Skipping notification email.")
    end
  end

end
