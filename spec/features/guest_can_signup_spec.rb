require 'rails_helper'

RSpec.feature "as an authenticated user, when I visit '/'" do
  scenario "i can sign up for a new account" do
    visit root_path
    click_on "Sign Up"

    expect(current_path).to eq(signup_path)

    fill_in :first_name, with: "janedoe@janedoe.com"
    fill_in :last_name, with: "janedoe@janedoe.com"
    fill_in :email, with: "janedoe@janedoe.com"
    fill_in :password, with: "password"
    fill_in :password_confirmation, with: "password"
    click_on "Submit"

    expect(current_path).to eq(root_path)
    # expect(page).to_not have_content("Sign Up")
    # expect(page).to have_content("...")

  end
end
