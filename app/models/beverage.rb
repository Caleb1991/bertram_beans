class Beverage < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :cost, presence: true, numericality: true
  has_many :coworker_beverages, dependent: :destroy
end