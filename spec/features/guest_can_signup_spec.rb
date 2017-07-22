require 'rails_helper'

RSpec.feature "as an authenticated user, when I visit '/'" do
  scenario "i can sign up for a new account" do
    visit root_path
    within(".navbar-collapse") do
      click_on "Sign Up"
    end

    expect(current_path).to eq(signup_path)

    fill_in "First name", with: "janedoe@janedoe.com"
    fill_in "Last name", with: "janedoe@janedoe.com"
    fill_in "Email", with: "janedoe@janedoe.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Submit"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Log Out")

  end
end
