require 'rails_helper'

RSpec.describe 'home', type: :feature do
  describe '/' do
    it 'contains a link for navigation' do
      visit '/'

      expect(page).to have_link('Add a Coworker')
      expect(page).to have_link('Add a Beverage')
      expect(page).to have_link('Determine Payer')
    end
  end
end