require 'rails_helper'

RSpec.feature "as an authenticated user, when I try to sign up" do
  scenario "I cannot sign up with an email already in use" do
    user1 = create(:user, email: "jane@janedoe.com", password: "password", password_confirmation: "password")

    visit root_path
    click_on "Sign Up"

    expect(current_path).to eq(signup_path)

    fill_in :first_name, with: "#{user1.first_name}"
    fill_in :last_name, with: "#{user1.last_name}"
    fill_in :email, with: "#{user1.email}"
    fill_in :password, with: "#{user1.password}"
    fill_in :password_confirmation, with: "#{user1.password_confirmation}"
    click_on "Submit"

    expect(current_path).to eq(signup_path)
    expect(page).to have_content("Sorry, but that email has already been taken.")
  end
end
