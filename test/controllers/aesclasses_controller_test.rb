require 'test_helper'

class AesclassesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @aesclass = aesclasses(:one)
  end

  test "should get index" do
    get aesclasses_url
    assert_response :success
  end

  test "should get new" do
    get new_aesclass_url
    assert_response :success
  end

  test "should create aesclass" do
    assert_difference('Aesclass.count') do
      post aesclasses_url, params: { aesclass: { name: @aesclass.name } }
    end

    assert_redirected_to aesclass_url(Aesclass.last)
  end

  test "should show aesclass" do
    get aesclass_url(@aesclass)
    assert_response :success
  end

  test "should get edit" do
    get edit_aesclass_url(@aesclass)
    assert_response :success
  end

  test "should update aesclass" do
    patch aesclass_url(@aesclass), params: { aesclass: { name: @aesclass.name } }
    assert_redirected_to aesclass_url(@aesclass)
  end

  test "should destroy aesclass" do
    assert_difference('Aesclass.count', -1) do
      delete aesclass_url(@aesclass)
    end

    assert_redirected_to aesclasses_url
  end
end
