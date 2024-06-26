class Coworker < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :cost_burden_incurred, numericality: true
  has_one :coworker_beverage, dependent: :destroy
  has_one :beverage, through: :coworker_beverage
end