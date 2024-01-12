class FeedbackMailer < ApplicationMailer
    def new_feedback_notification(feedback)
        @feedback = feedback
        @blog = feedback.blog
        @user = @blog.user
    
        mail(to: @user.email, subject: 'New feedback on Your blog')
    end
end
