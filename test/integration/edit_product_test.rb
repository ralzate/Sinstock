require 'test_helper'

class EditProductTest < ActionDispatch::IntegrationTest

  def setup
    @product = products(:one)
  end

  test "shouldn't get edit when not logged in" do
    get edit_product_path(@product)
    assert_redirected_to login_path
  end
end
