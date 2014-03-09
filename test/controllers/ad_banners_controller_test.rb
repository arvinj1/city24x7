require 'test_helper'

class AdBannersControllerTest < ActionController::TestCase
  setup do
    @ad_banner = ad_banners(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ad_banners)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ad_banner" do
    assert_difference('AdBanner.count') do
      post :create, ad_banner: { counter: @ad_banner.counter, name: @ad_banner.name, see: @ad_banner.see, selected: @ad_banner.selected }
    end

    assert_redirected_to ad_banner_path(assigns(:ad_banner))
  end

  test "should show ad_banner" do
    get :show, id: @ad_banner
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ad_banner
    assert_response :success
  end

  test "should update ad_banner" do
    patch :update, id: @ad_banner, ad_banner: { counter: @ad_banner.counter, name: @ad_banner.name, see: @ad_banner.see, selected: @ad_banner.selected }
    assert_redirected_to ad_banner_path(assigns(:ad_banner))
  end

  test "should destroy ad_banner" do
    assert_difference('AdBanner.count', -1) do
      delete :destroy, id: @ad_banner
    end

    assert_redirected_to ad_banners_path
  end
end
