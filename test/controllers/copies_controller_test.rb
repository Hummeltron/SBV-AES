require 'test_helper'

class CopiesControllerTest < ActionController::TestCase
  setup do
    @copy = copies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:copies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create copy" do
    assert_difference('Copy.count') do
      post :create, copy: { book_id: @copy.book_id, code: @copy.code, student_id: @copy.student_id, topay: @copy.topay }
    end

    assert_redirected_to copy_path(assigns(:copy))
  end

  test "should show copy" do
    get :show, id: @copy
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @copy
    assert_response :success
  end

  test "should update copy" do
    patch :update, id: @copy, copy: { book_id: @copy.book_id, code: @copy.code, student_id: @copy.student_id, topay: @copy.topay }
    assert_redirected_to copy_path(assigns(:copy))
  end

  test "should destroy copy" do
    assert_difference('Copy.count', -1) do
      delete :destroy, id: @copy
    end

    assert_redirected_to copies_path
  end
end
