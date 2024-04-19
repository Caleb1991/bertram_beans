class Coworker < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end