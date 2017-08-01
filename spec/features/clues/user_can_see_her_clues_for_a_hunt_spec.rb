require 'rails_helper'

RSpec.feature "as an authenticated user", js: :true do
  before do
    @user = create(:user)
    @hunt = @user.hunts.create(name: "An urban hunt", description: "This is a hunt description", status: "draft")
    @clue1 = @hunt.clues.create(title: "A clue", description: "A clue description", task_type: "photo", order: 1)
    @clue2 = @hunt.clues.create(title: "Another clue", description: "Another clue description", task_type: "trivia", order: 2)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end
  xscenario "i can see my clues on a specific hunt" do
    visit hunts_path

    within(".id_#{@hunt.id}") do
      click_on "Add clues"
    end

    save_and_open_page
    expect(current_path).to eq(hunt_clues_path(@hunt))

    expect(page).to have_content("#{@clue1.title}")
    expect(page).to have_content("#{@clue1.description}")
    expect(page).to have_content("#{@clue2.title}")
    expect(page).to have_content("#{@clue2.description}")
  
  end
end
