class User < ApplicationRecord
  has_secure_password
  has_many :hunts
  has_many :user_teams
  has_many :teams, through: :user_teams

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, confirmation: true, presence: true
  validates :password_confirmation, presence: true

  enum role: %w(user admin)
end
