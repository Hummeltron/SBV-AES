require 'test_helper'

class BookdetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bookdetail = bookdetails(:one)
  end

  test "should get index" do
    get bookdetails_url
    assert_response :success
  end

  test "should get new" do
    get new_bookdetail_url
    assert_response :success
  end

  test "should create bookdetail" do
    assert_difference('Bookdetail.count') do
      post bookdetails_url, params: { bookdetail: { ISBN: @bookdetail.ISBN, Leihbuch: @bookdetail.Leihbuch, imgpath: @bookdetail.imgpath, preis: @bookdetail.preis } }
    end

    assert_redirected_to bookdetail_url(Bookdetail.last)
  end

  test "should show bookdetail" do
    get bookdetail_url(@bookdetail)
    assert_response :success
  end

  test "should get edit" do
    get edit_bookdetail_url(@bookdetail)
    assert_response :success
  end

  test "should update bookdetail" do
    patch bookdetail_url(@bookdetail), params: { bookdetail: { ISBN: @bookdetail.ISBN, Leihbuch: @bookdetail.Leihbuch, imgpath: @bookdetail.imgpath, preis: @bookdetail.preis } }
    assert_redirected_to bookdetail_url(@bookdetail)
  end

  test "should destroy bookdetail" do
    assert_difference('Bookdetail.count', -1) do
      delete bookdetail_url(@bookdetail)
    end

    assert_redirected_to bookdetails_url
  end
end
