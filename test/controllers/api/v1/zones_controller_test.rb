require "test_helper"

class API::V1::ZonesControllerTest < ActionController::TestCase

  def setup
    request.env['HTTP_AUTHORIZATION'] = user.authentication_token
  end

  def user
    @user ||= users(:one)
  end

  def zone
    @zone ||= zones(:one)
  end

  def json 
    JSON.parse response.body
  end

  # Authentication 
  test "GET zones with valid authentication has a 200 status code" do
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
    get :index
    assert_equal zone.id, json["zones"].first["id"]
    assert_nil json["zones"].first["created_at"]
  end

  # GET zones/:id
  test "GET zone/:id with valid authentication returns that zone" do
    get :show, id: zone.id
    assert_equal zone.id, json["zone"]["id"]
  end

  test "GET zone/:id with non-existent id has a 404 status code" do
    get :show, id: -1
    assert_equal 404, response.status
  end

  test "GET zone/:id with unauthorized resource has a 403 status code" do
    zone.update(user: users(:two))
    get :show, id: zone.id
    assert_equal 403, response.status
  end

  # PATCH zones/:id
  test "PATCH zone/:id with valid credentials has a 204 status code" do
    patch :update, id: zone.id, zone: {name: zones(:two).name, city_name: zones(:two).city_name, minutes_offset: zones(:two).minutes_offset}
    assert_equal 204, response.status
  end

  test "PATCH zone/:id with valid credentials updates the resource" do
    patch :update, id: zone.id, zone: {name: zones(:two).name, city_name: zones(:two).city_name, minutes_offset: zones(:two).minutes_offset}
    updated_zone = Zone.find(zone.id)
    assert_equal zones(:two).name, updated_zone.name
    assert_equal zones(:two).city_name, updated_zone.city_name
    assert_equal zones(:two).minutes_offset, updated_zone.minutes_offset
  end

  test "PATCH zone/:id with bad parameters has a 403 status code" do
    patch :update, id: zone.id, zone: {minutes_offset: "string"}
    assert_equal 403, response.status
  end

  test "PATCH zone/:id with bad parameters returns error messages" do
    patch :update, id: zone.id, zone: {minutes_offset: "string"}
    assert_equal "is not a number", json["errors"]["minutes_offset"][0]
  end



end



