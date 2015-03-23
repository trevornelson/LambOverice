require 'capybara/rspec'
require 'rails_helper'

feature "user creates an account" do

  scenario "user signs up for account" do
    visit '/users/new'
    within('#signup') do
      fill_in 'Username', with: "Chriseldo"
      fill_in 'Email', with: "Chiseldo@gmail.com"
      fill_in 'Password', with: "1234"
    end
    click_button "Create Account"
    expect(page).to have_content 'Logout'
  end

end