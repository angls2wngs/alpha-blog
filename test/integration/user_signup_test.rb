require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest
  
  test "new user signup" do
    get signup_path  
    assert_template 'users/new'
   assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: {name: "testing", email: "testing@example.com", password: "password"}
    end
    assert_template 'users/show'
    assert_match "testing", response.body
  end
end

