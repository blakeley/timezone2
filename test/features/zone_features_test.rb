require "test_helper"

class ZoneFeaturesTest < Capybara::Rails::TestCase

  def setup
    Capybara.current_driver = Capybara.javascript_driver
    @user = User.first
    @zone = @user.zones.first
    visit root_path
    assert_content 'Sign in'
    page.fill_in 'email', with: @user.email
    page.fill_in 'password', with: "password"
    click_button 'Sign in'
  end


  test "index" do
    assert_content 'Name'
    assert_content 'City'
    assert_content 'Difference'
    assert_content 'Current Time'
  end

  test "delete" do
    assert_content @zone.name
    page.find('.glyphicon-remove').click
    refute_content @zone.city_name
  end

end
