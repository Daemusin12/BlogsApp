require "test_helper"

class FeedbackControllerTest < ActionDispatch::IntegrationTest

  setup do
    @user = users(:user_one)
    sign_in @user

    @blog = blogs(:blog_one)
    @blog.user = @user
    @blog.save
  end

  test 'should create feedback' do
    assert_difference('Feedback.count') do
      post blog_feedbacks_path(@blog), params: { feedback: { content: 'Great post!' } }
    end

    assert_redirected_to blog_path(@blog)

    assert_equal 1, ActionMailer::Base.deliveries.size
    feedback_email = ActionMailer::Base.deliveries.first
    assert_equal [@user.email], feedback_email.to
    assert_equal 'New feedback on Your blog', feedback_email.subject

  end

  test 'should not create invalid feedback' do
    assert_no_difference('Feedback.count') do
      post blog_feedbacks_path(@blog), params: { feedback: { content: '' } }
    end

    assert_response :success

  end
end
