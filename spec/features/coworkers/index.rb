require 'rails_helper'

RSpec.describe Coworker, type: :feature do
  describe '/coworkers' do 
    before :each do
      Coworker.create!(name: 'Peanut')
      Coworker.create!(name: 'Anya')
    end

    it 'shows all beverages and has a delete button for each' do
      visit '/beverages'

      expect(page).to have_content('Peanut')
      expect(page).to have_content('Anya')
      expect(page).to have_button('Delete', count: 2)
    end
  end
end