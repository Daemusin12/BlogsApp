require "test_helper"

class BlogTest < ActiveSupport::TestCase
  test 'should be valid with valid attributes' do
    user = users(:user_one)
    blog = Blog.new(title: 'Example Title', body: 'Example Body', user: user)

    assert blog.valid?
  end

  test "should not be valid without a title" do
    user = users(:user_one)
    blog = Blog.new(body: "Lorem ipsum", user: user)
    assert_not blog.valid?
  end

  test "should not be valid without a body" do
    user = users(:user_one)
    blog = Blog.new(title: "Example Title" , user: user)
    assert_not blog.valid?
  end
end