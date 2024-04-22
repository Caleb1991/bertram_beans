require 'rails_helper'

RSpec.describe CoworkerBeverage, type: :feature do
  before :each do
    Coworker.create!(name: 'Peanut')
    Beverage.create!(name: 'Hot Choccy', cost: 1.05)
    CoworkerBeverage.create!(beverage_id: Beverage.first.id, coworker_id: Coworker.first.id)
  end

  describe 'index' do
  end
end