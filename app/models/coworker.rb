class Coworker < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :cost_burden_incurred, numericality: true
  has_one :coworker_beverage
  has_one :beverage, through: :coworker_beverage
end