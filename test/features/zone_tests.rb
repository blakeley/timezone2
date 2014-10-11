require "test_helper"

class ZoneTest < Capybara::Rails::TestCase

  def setup
    Capybara.current_driver = Capybara.javascript_driver
    visit root_path
    assert_content 'Sign in'
    page.fill_in 'email', with: "user@mail.com"
    page.fill_in 'password', with: "password"
    click_button 'Sign in'
  end


  test "index" do
    assert_content 'Name'
    assert_content 'City'
    assert_content 'Difference'
    assert_content 'Current Time'
  end

end
