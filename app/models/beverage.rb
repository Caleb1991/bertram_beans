class Beverage < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :cost, presence: true, numericality: true
  belongs_to :coworker
end