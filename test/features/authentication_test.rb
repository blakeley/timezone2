require "test_helper"

class AuthenticationTest < Capybara::Rails::TestCase

  def setup
    Capybara.current_driver = Capybara.javascript_driver
  end

  test "sanity" do
    visit root_path
    assert_content page, "Hello World"
    refute_content page, "Goobye All!"
  end

  test "sign in" do
    visit root_path
    page.fill_in 'email', with: "user@mail.com"
    page.fill_in 'password', with: "password"
    click_button 'Sign in'
    assert_content 'signed in'
  end

end
