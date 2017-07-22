require 'rails_helper'

RSpec.feature "as an authenticated user, when I try to sign up" do
  scenario "I cannot sign up if password and confirmation do not match" do
    visit root_path
    save_and_open_page
    within(".navbar-collapse") do
      click_on "Sign Up"
    end

    expect(current_path).to eq(signup_path)

    fill_in :first_name, with: "janedoe@janedoe.com"
    fill_in :last_name, with: "janedoe@janedoe.com"
    fill_in :email, with: "janedoe@janedoe.com"
    fill_in :password, with: "password"
    fill_in :password_confirmation, with: "1234"
    click_on "Submit"

    expect(current_path).to eq(signup_path)
    expect(page).to have_content("Password confirmation doesn't match password.")
  end
end
