require 'rails_helper'

RSpec.describe CoworkerBeverage, type: :feature do
  before :each do
    Coworker.create!(name: 'Peanut')
    Beverage.create!(name: 'Hot Choccy', cost: 1.05)
    CoworkerBeverage.create!(beverage_id: Beverage.first.id, coworker_id: Coworker.first.id)
  end

  describe 'index' do
    it 'contains a button to determine the payer' do
      visit '/coworker_beverages'

      expect(page).to have_button('Determine Payer')
    end
  end
end