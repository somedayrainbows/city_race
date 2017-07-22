require 'rails_helper'

RSpec.feature "as an authenticated user, when I try to sign up" do
  scenario "I cannot sign up with an email already in use" do
    user1 = create(:user, email: "jane@janedoe.com", password: "password", password_confirmation: "password")

    visit root_path
    within(".navbar-collapse") do
      click_on "Sign Up"
    end

    expect(current_path).to eq(signup_path)

    fill_in "First name", with: "#{user1.first_name}"
    fill_in "Last name", with: "#{user1.last_name}"
    fill_in "Email", with: "#{user1.email}"
    fill_in "Password", with: "#{user1.password}"
    fill_in "Password confirmation", with: "#{user1.password_confirmation}"
    click_on "Submit"

    expect(current_path).to eq(signup_path)


    expect(page).to have_content("Sorry, but that email has already been taken.")
  end
end
