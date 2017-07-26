class Hunt < ApplicationRecord
  belongs_to :user
  has_many :teams
  has_many :clues, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
  validates :status, presence: true
end
