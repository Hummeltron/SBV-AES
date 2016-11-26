require 'test_helper'

class ClassnamesControllerTest < ActionController::TestCase
  setup do
    @classname = classnames(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:classnames)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create classname" do
    assert_difference('Classname.count') do
      post :create, classname: { name: @classname.name, year: @classname.year }
    end

    assert_redirected_to classname_path(assigns(:classname))
  end

  test "should show classname" do
    get :show, id: @classname
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @classname
    assert_response :success
  end

  test "should update classname" do
    patch :update, id: @classname, classname: { name: @classname.name, year: @classname.year }
    assert_redirected_to classname_path(assigns(:classname))
  end

  test "should destroy classname" do
    assert_difference('Classname.count', -1) do
      delete :destroy, id: @classname
    end

    assert_redirected_to classnames_path
  end
end
