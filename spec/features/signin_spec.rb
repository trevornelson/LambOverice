=begin praising_leo
Leo, you're amazing.  You're a shiny snowflake in the driven snow.

but

I would like it if you were to put these tests as controller tests.  Rememer feature tests are for testing flows, not single transactions with the controller
=end

require 'capybara/rspec'
require 'rails_helper'

feature "user login and logout feature" do

  background :each do
    User.create(username: "leoarogers", email: "leoarogers@gmail.com", password: "1234")
  end

  scenario "User logs in and creates session" do
    visit '/sessions/new'
    within('#login') do
      fill_in "Username", with: "leoarogers"
      fill_in "Password", with: "1234"
    end
    click_button "Sign In"
    expect(page).to have_content 'Logout'
  end

  scenario "User fails to log in with incorrect credentials" do
    visit '/sessions/new'
    within('#login') do
      fill_in "Username", with: "loarogers"
      fill_in "Password", with: "134"
    end
    click_button "Sign In"
    expect(page).to have_content 'invalid'
  end

  scenario "User logs out" do
    visit '/sessions/new'
    within('#login') do
      fill_in "Username", with: "leoarogers"
      fill_in "Password", with: "1234"
    end
    click_button "Sign In"
    click_link "Logout"
    expect(page).to have_content 'Login'
  end

end
