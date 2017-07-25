class Team < ApplicationRecord
  belongs_to :hunt
  has_many :user_teams
  has_many :users, through: :user_teams
end
