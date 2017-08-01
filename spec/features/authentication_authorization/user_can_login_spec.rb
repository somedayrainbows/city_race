require 'rails_helper'

RSpec.feature "as a user" do
  before do
    @user = create(:user)
  end
  scenario "i can log in" do
    visit root_path

    within(".navbar-collapse") do
      click_on "Log In"
    end

    expect(current_path).to eq(login_path)

    fill_in "email", with: "#{@user.email}"
    fill_in "password", with: "#{@user.password}"
    click_on "Submit"

    expect(current_path).to eq(user_path(@user.id))
    expect(page).to have_content("You have logged in successfully.")
    within(".navbar-collapse") do
      expect(page).to have_content("Log Out")
    end
  end
end
