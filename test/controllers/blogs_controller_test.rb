require "test_helper"

class BlogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:user_one)
    sign_in @user
  end

  test 'should get index' do
    get blogs_url
    assert_response :success
    assert_not_nil assigns(:blogs)
    assert_not_nil assigns(:blog)
  end

  test 'should show blog' do
    blog = blogs(:blog_one)
    get blog_url(blog)
    assert_response :success
    assert_not_nil assigns(:blog)
    assert_not_nil assigns(:feedbacks)
  end

  test 'should create blog' do
    assert_difference('Blog.count') do
      post blogs_url, params: { blog: { title: 'New Blog', body: 'Blog Content' } }
    end

    assert_redirected_to blogs_url
  end

  test 'should not create invalid blog' do
    assert_no_difference('Blog.count') do
      post blogs_url, params: { blog: { title: '', body: '' } }
    end

    assert_response :success
  
  end
end
