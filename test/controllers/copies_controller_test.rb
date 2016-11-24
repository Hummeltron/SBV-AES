require 'test_helper'

class CopiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @copy = copies(:one)
  end

  test "should get index" do
    get copies_url
    assert_response :success
  end

  test "should get new" do
    get new_copy_url
    assert_response :success
  end

  test "should create copy" do
    assert_difference('Copy.count') do
      post copies_url, params: { copy: { code: @copy.code, label: @copy.label } }
    end

    assert_redirected_to copy_url(Copy.last)
  end

  test "should show copy" do
    get copy_url(@copy)
    assert_response :success
  end

  test "should get edit" do
    get edit_copy_url(@copy)
    assert_response :success
  end

  test "should update copy" do
    patch copy_url(@copy), params: { copy: { code: @copy.code, label: @copy.label } }
    assert_redirected_to copy_url(@copy)
  end

  test "should destroy copy" do
    assert_difference('Copy.count', -1) do
      delete copy_url(@copy)
    end

    assert_redirected_to copies_url
  end
end
