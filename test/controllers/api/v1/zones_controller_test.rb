require "test_helper"

class API::V1::ZonesControllerTest < ActionController::TestCase

  def user
    @user ||= User.create(email: 'user@mail.com', password: 'password')
  end

  def zone
    @zone ||= user.zones.create(name: "Pacific Standard Time", city_name: "Portland, OR", minutes_offset: -7*60)
  end

  def json 
    JSON.parse response.body
  end

  # Authentication 
  test "GET zones with valid authentication has a 200 status code" do
    request.env['HTTP_AUTHORIZATION'] = user.authentication_token
    get :index
    assert_equal 200, response.status
  end

  test "GET zones with invalid authentication has a 403 status code" do
    request.env['HTTP_AUTHORIZATION'] = "bad" + user.authentication_token
    get :index
    assert_equal 403, response.status
  end

  test "GET zones with invalid authentication returns error messages" do
    request.env['HTTP_AUTHORIZATION'] = "bad" + user.authentication_token
    get :index
    refute_nil json["message"]
  end


end
