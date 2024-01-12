require "test_helper"

class FeedbackTest < ActiveSupport::TestCase
  test 'should be valid with valid attributes' do
    user = users(:user_one)  
    blog = blogs(:blog_one)  
    feedback = Feedback.new(content: 'Example Content', user: user, blog: blog)

    assert feedback.valid?
  end

  test 'should not be valid without content' do
    user = users(:user_one)
    blog = blogs(:blog_one)
    feedback = Feedback.new(user: user, blog: blog)

    assert_not feedback.valid?

  end
end
