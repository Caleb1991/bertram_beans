require 'rails_helper'

RSpec.describe 'home', type: :feature do
  describe '/' do
    it 'contains a link for navigation' do
      visit '/'

      expect(page).to have_link('Add a Coworker')
      expect(page).to have_link('Add a Beverage')
      expect(page).to have_link("Add a Coworker's Order")
      expect(page).to have_link('Determine Payer')
      expect(page).to have_link('Bertram Beans')
      expect(page).to have_link('All Coworkers')
      expect(page).to have_link('All Beverages')
    end
  end
  
  describe 'navigation' do
    it 'takes you to various places of the product' do
      visit '/'
      
      click_link('Add a Coworker')
      expect(page).to have_current_path('/coworkers/new')
      click_link('All Coworkers')
      expect(page).to have_current_path('/coworkers')
      click_link('Add a Beverage')
      expect(page).to have_current_path('/beverages/new')
      click_link('All Beverages')
      expect(page).to have_current_path('/beverages')
      click_link("Add a Coworker's Order")
      expect(page).to have_current_path('/coworker_beverages/new')
      click_link('Determine Payer')
      expect(page).to have_current_path('/coworker_beverages')
      click_link('Bertram Beans')
      expect(page).to have_current_path('/')
    end
  end
end