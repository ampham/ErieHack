require 'test_helper'

# test for pagination in secion 10.3.4
class UsersIndexTest < ActionDispatch::IntegrationTest
	def setup
    # admin and non-admin users for testing delete authorization
    @admin     = users(:michael)
    @non_admin = users(:archer)
  end

  # Testing the functionality of pagination and delete features
  test "index as admin including pagination and delete links" do
    log_in_as(@admin)
    get users_path
    assert_template 'users/index'
    assert_select 'div.pagination'
    first_page_of_users = User.paginate(page: 1)
    first_page_of_users.each do |user|
      assert_select 'a[href=?]', user_path(user), text: user.name
      unless user == @admin
        assert_select 'a[href=?]', user_path(user), text: 'delete'
      end
    end
    assert_difference 'User.count', -1 do
      delete user_path(@non_admin)
    end
  end

  # A non-admin user looks for a link containing the text 'delete' on users index
  # If everything works correctly, there should not be any 
  test "index as non-admin" do
    log_in_as(@non_admin)
    get users_path
    assert_select 'a', text: 'delete', count: 0
  end
end