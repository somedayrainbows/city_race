require 'rails_helper'

RSpec.feature "as an unauthenticated user, when I try to sign up" do
  scenario "I cannot sign up if password and confirmation do not match" do
    visit root_path
    within(".navbar-collapse") do
      click_on "Sign Up"
    end

    expect(current_path).to eq(signup_path)

    fill_in "First name", with: "janedoe@janedoe.com"
    fill_in "Last name", with: "janedoe@janedoe.com"
    fill_in "Email", with: "janedoe@janedoe.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "1234"
    click_on "Submit"

    expect(current_path).to eq(signup_path)
    expect(page).to have_content("Password confirmation doesn't match password.")
  end
end
