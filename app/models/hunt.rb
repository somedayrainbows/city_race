class Hunt < ApplicationRecord
  belongs_to :user
  has_many :teams
  has_many :clues
end
