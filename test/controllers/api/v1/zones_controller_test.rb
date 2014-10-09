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

  # GET zones
  test "GET zones with valid authentication returns all zones" do
    zone.save
    request.env['HTTP_AUTHORIZATION'] = user.authentication_token
    get :index
    assert_equal zone.id, json["zones"].first["id"]
    assert_nil json["zones"].first["created_at"]
  end

  # GET zones/:id
  test "GET zone/:id with valid authentication returns that zone" do
    zone.save
    request.env['HTTP_AUTHORIZATION'] = user.authentication_token
    get :show, id: zone.id
    assert_equal zone.id, json["zone"]["id"]
  end

  test "GET zone/:id with non-existent id has a 404 status code" do
    request.env['HTTP_AUTHORIZATION'] = user.authentication_token
    get :show, id: -1
    assert_equal response.status, 404
  end

  test "GET zone/:id with unauthorized resource has a 403 status code" do
    other_user = User.create(email: 'other_user@mail.com', password: 'password')
    other_zone = other_user.zones.create(name: "Pacific Standard Time", city_name: "Seattle, WA", minutes_offset: -7*60)
    request.env['HTTP_AUTHORIZATION'] = user.authentication_token
    get :show, id: other_zone.id
    assert_equal response.status, 403
  end





end
