require 'rails_helper'

RSpec.describe Beverage, type: :feature do
  describe '/coworkers' do 
    before :each do
      Beverage.create!(name: 'Tea, Earl Grey, Hot', cost: 2.00)
      Beverage.create!(name: 'Hot Chocolate', cost: 4.00)
    end

    it 'shows all beverages and has a delete button for each' do
      visit '/beverages'

      expect(page).to have_content('Tea, Earl Grey, Hot')
      expect(page).to have_content('2.0')
      expect(page).to have_content('Hot Chocolate')
      expect(page).to have_content('4.0')
      expect(page).to have_button('Delete', count: 2)
    end
  end
end