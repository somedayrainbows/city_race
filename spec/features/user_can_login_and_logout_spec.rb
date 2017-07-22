require 'rails_helper'

RSpec.feature "as a user" do
  before do
    @user = create(:user)
  end
  xscenario "i can log in and log out" do
    visit root_path
    expect(current_path).to eq(login_path)

    fill_in "email", with: "#{@user.email}"
    fill_in "password", with: "#{@user.password}"
    click_on "Submit"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Welcome: #{@user.email}")
    expect(page).to have_content("Sign Out")

    click_on "Sign Out"

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Sign Up")
    expect(page).to have_content("You have logged out successfully.")
  end

  xscenario "i receive an error if my credentials are not valid" do
    visit root_path
    expect(current_path).to eq(login_path)

    fill_in "email", with: "somerandomemail@gmail.com"
    fill_in "password", with: "#{@user.password}"
    click_on "Submit"

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Invalid user/password combination! Please try again.")
    expect(page).to have_content("Sign Up")
  end
end
