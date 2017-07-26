class Seed

  def self.start
    seed = Seed.new
    seed.seed_all_users
    seed.seed_admin
    seed.seed_all_hunts
    seed.seed_all_teams
    seed.seed_all_user_teams
    seed.seed_all_clues
  end

  def seed_all_users
    20.times do |u|
      user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "heyhey", password_confirmation: "heyhey", role: 0)
      puts "User #{user.first_name} #{user.last_name} created successfully."
    end
  end

  def seed_admin
    user = User.create!(first_name: "Erin", last_name: "Bassity", email: "erin@hey.com", password: "hey", password_confirmation: "hey", role: 1)
    puts "Admin #{user.first_name} #{user.last_name} created successfully."
  end

  def seed_all_hunts
    User.find(2).hunts.create!(name: "Chicago Scavenger Hunt", description: "An urban jaunt around downtown Chicago, out to Navy Pier, and up around Wrigley Field.", status: "draft")
    User.find(5).hunts.create!(name: "Austin Scavenger Hunt", description: "An urban jaunt around downtown Austin and the UT campus.", status: "active")
    User.find(8).hunts.create!(name: "New York Scavenger Hunt", description: "An urban hunt around Central Park and parts of Midtown.", status: "draft")
    puts "3 hunts created successfully."
  end

  def seed_all_teams
    Hunt.all.each do |h|
      4.times do |t|
        team = h.teams.create!(name: Faker::GameOfThrones.house, access_code: Faker::Number.number(4))
        puts "Team #{team.name} created successfully."

      end
    end
  end

  def seed_all_user_teams

  end

  def seed_all_clues
    Hunt.all.each do |h|
      counter = 0
      10.times do |c|
        clue = h.clues.create!(title: Faker::Beer.name, description: Faker::ChuckNorris.fact, task_type: "photo challenge", order: counter += 1)
        puts "Clue #{clue.title}  created successfully."
      end
    end
  end

end


Seed.start
