require 'test_helper'

class SectorCategoriesControllerTest < ActionController::TestCase
  setup do
    @sector_category = sector_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sector_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sector_category" do
    assert_difference('SectorCategory.count') do
      post :create, sector_category: { description: @sector_category.description, name: @sector_category.name }
    end

    assert_redirected_to sector_category_path(assigns(:sector_category))
  end

  test "should show sector_category" do
    get :show, id: @sector_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sector_category
    assert_response :success
  end

  test "should update sector_category" do
    patch :update, id: @sector_category, sector_category: { description: @sector_category.description, name: @sector_category.name }
    assert_redirected_to sector_category_path(assigns(:sector_category))
  end

  test "should destroy sector_category" do
    assert_difference('SectorCategory.count', -1) do
      delete :destroy, id: @sector_category
    end

    assert_redirected_to sector_categories_path
  end
end
