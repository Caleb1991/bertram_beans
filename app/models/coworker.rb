class Coworker < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :cost_burden_incurred, numericality: true
  has_one :beverage
end