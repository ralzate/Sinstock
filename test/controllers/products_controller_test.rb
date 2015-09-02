require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: { description: @product.description, name: @product.name, new_used: @product.new_used, price: @product.price, quantity: @product.quantity, reference: @product.reference, state_product: @product.state_product, stock: @product.stock, total: @product.total, type_product_id: @product.type_product_id, unit_price: @product.unit_price, user_id: @product.user_id }
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success
  end

  test "should update product" do
    patch :update, id: @product, product: { description: @product.description, name: @product.name, new_used: @product.new_used, price: @product.price, quantity: @product.quantity, reference: @product.reference, state_product: @product.state_product, stock: @product.stock, total: @product.total, type_product_id: @product.type_product_id, unit_price: @product.unit_price, user_id: @product.user_id }
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end
end
