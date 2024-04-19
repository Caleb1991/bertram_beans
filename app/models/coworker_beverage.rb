class CoworkerBeverage < ApplicationRecord
  belongs_to :beverage
  belongs_to :coworker
end