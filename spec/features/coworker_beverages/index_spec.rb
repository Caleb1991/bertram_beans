require 'rails_helper'

RSpec.describe CoworkerBeverage, type: :feature do
  before :each do
    Coworker.create!(name: 'Peanut')
    Beverage.create!(name: 'Hot Choccy', cost: 1.05)
    CoworkerBeverage.create!(beverage_id: Beverage.first.id, coworker_id: Coworker.first.id)
  end

  describe 'index' do
    it 'shows whose turn it is to pay and returns a receipt' do
      visit '/coworker_beverages'

      expect(page).to have_content('Congratulations (we think???) Peanut it is your turn to pay!')
      expect(page).to have_content('Grand Total $1.05')
      expect(page).to have_link('See you tomorrow!')
    end

    it 'has a link to determin the payer again' do
      visit '/coworker_beverages'
      click_link('See you tomorrow!')
      expect(page).to have_current_path('/coworker_beverages')
    end
  end
end