class Seed

  def self.start
    seed = Seed.new
    seed.seed_all_users
    seed.seed_all_hunts
    seed.seed_all_teams
    seed.seed_all_user_teams
    seed.seed_all_clues
  end

  def seed_all_users
    20.times do |u|
      user = User.create!(first_name: Faker::Name.name, last_name: Faker::Name.name, email: Faker::Internet.email, password: "heyhey", password_confirmation: "heyhey", role: 0)
    end
    user = User.create!(first_name: "Erin", last_name: "Bassity", email: "ebassity@gmail.com", password: "heyhey", password_confirmation: "heyhey", role: 1)
    end
  end

  def seed_all_hunts
    User.all.sample.hunts.create!(name: "Chicago Scavenger Hunt", description: "An urban jaunt around downtown Chicago, out to Navy Pier, and up around Wrigley Field.", status: "draft")
    User.all.sample.hunts.create!(name: "Austin Scavenger Hunt", description: "An urban jaunt around downtown Austin and the UT campus.", status: "active")
    User.all.sample.hunts.create!(name: "New York Scavenger Hunt", description: "An urban hunt around Central Park and parts of Midtown.", status: "draft")
  end

  def seed_all_teams
    Hunt.all.each do |h|
      4.times do |t|
        team = h.teams.create!(name: Faker::GameOfThrones.house, access_code: Faker::Number.number(4))
      end
    end
  end

  def seed_all_user_teams
    # Team.all.each do |t|
    #   4.times do |u|
    #     user = User.all.sample

  end

  def seed_all_clues

  end

end
