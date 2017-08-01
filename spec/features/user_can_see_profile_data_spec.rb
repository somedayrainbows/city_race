require 'rails_helper'

RSpec.feature "as an authenticated user" do
  before do
    @user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end
  scenario "when I log in I can see a link to my profile in the nav" do
    visit root_path

    within(".navbar-collapse") do
      expect(page).to have_content("My Profile")
    end
  end

  scenario "i can visit my profile page" do
    visit root_path

    within(".navbar-collapse") do
      click_on "My Profile"
    end

    expect(current_path).to eq(user_path(@user.id))
  end
  scenario "i can see my data on my profile page" do
    visit user_path(@user.id)

    expect(page).to have_content(@user.first_name)
    expect(page).to have_content(@user.last_name)
    expect(page).to have_content(@user.email)
    expect(page).to have_content("My Hunts")
    expect(page).to have_content("Create a Hunt")
  end
end
