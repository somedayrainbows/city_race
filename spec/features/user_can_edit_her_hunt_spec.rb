require 'rails_helper'

RSpec.feature "as an authenticated user" do
  before do
    @user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    @hunt = @user.hunts.create(name: "A Scavenger Hunt", description: "This show was cancelled. I mean, COME ON.")
  end
  scenario "i can edit my own hunt" do
    visit hunts_path
    expect(page).to have_content("A Scavenger Hunt")

    click_on "Edit Hunt"

    expect(current_path).to eq(edit_hunt_path(@hunt.id))

    fill_in "Name", with: "A Very Fun Scavenger Hunt"
    fill_in "Description", with: "There's been a lot of lying in this family. And a lot of love! More lies. Teamocil. I hate the Wetlands. They're stupid and wet, and there are bugs everywhere, and I think I maced a crane. A group of British builders operating outside the O.C. Hey, it was one night of wild passion! And yet you didn't notice her body? I like to look in the mirror. I made a huge tiny mistake."
    click_on "Edit Hunt"

    expect(current_path).to eq(hunts_path)
    expect(page).to have_content("Hunt details updated successfully.")
    expect(page).to have_content("A Very Fun Scavenger Hunt")
    expect(page).to_not have_content("A Scavenger Hunt")
  end
end
