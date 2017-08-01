require 'rails_helper'

RSpec.feature "as an authenticated user" do
  before do
    @user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    @hunt = @user.hunts.create(name: "A Scavenger Hunt", description: "This show was cancelled. I mean, COME ON.")
  end
  scenario "i can delete my own hunt" do
    visit hunts_path
    expect(page).to have_content("A Scavenger Hunt")

    click_on "Delete Hunt"

    expect(current_path).to eq(hunts_path)

    expect(page).to have_content("Hunt deleted successfully.")
    expect(page).to_not have_content("A Scavenger Hunt")
  end
end
