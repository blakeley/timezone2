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

  # PATCH zones/:id
  test "PATCH zone/:id with valid credentials has a 204 status code" do
    zone.save
    request.env['HTTP_AUTHORIZATION'] = user.authentication_token
    patch :update, id: zone.id, zone: {name: "New name", city_name: "New City", minutes_offset: 0}
    assert_equal response.status, 204
  end

  test "PATCH zone/:id with valid credentials updates the resource" do
    other_zone = Zone.create(name: "name", city_name: "city_name", minutes_offset: 0, user: user)
    request.env['HTTP_AUTHORIZATION'] = user.authentication_token
    patch :update, id: other_zone.id, zone: {name: zone.name, city_name: zone.city_name, minutes_offset: zone.minutes_offset}
    other_zone = Zone.find(other_zone.id)
    assert_equal zone.name, other_zone.name
    assert_equal zone.city_name, other_zone.city_name
    assert_equal zone.minutes_offset, other_zone.minutes_offset
  end

  test "PATCH zone/:id with bad parameters has a 403 status code" do
    zone.save
    request.env['HTTP_AUTHORIZATION'] = user.authentication_token
    patch :update, id: zone.id, zone: {minutes_offset: "string"}
    assert_equal response.status, 403
  end

  test "PATCH zone/:id with bad parameters returns error messages" do
    zone.save
    request.env['HTTP_AUTHORIZATION'] = user.authentication_token
    patch :update, id: zone.id, zone: {minutes_offset: "string"}
    assert_equal "is not a number", json["errors"]["minutes_offset"][0]
  end



end



