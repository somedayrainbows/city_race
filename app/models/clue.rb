class Clue < ApplicationRecord
  belongs_to :hunt

  validates :title, presence: true
  validates :description, presence: true
  validates :task_type, presence: true
  validates :order, presence: true
end
