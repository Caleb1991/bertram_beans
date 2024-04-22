require 'rails_helper'

RSpec.describe CoworkerBeverage, type: :feature do
  describe '/new' do
    before :each do
      Beverage.create!(name: 'Tea, Earl Grey, Hot', cost: 2.00)
      Coworker.create!(name: 'Anya')
    end

    it 'contains a form for adding an order' do
      visit '/coworker_beverages/new'

      expect(page).to have_field(:coworker_beverage_beverage_id)
      expect(page).to have_field(:coworker_beverage_coworker_id)
      expect(page).to have_button('Create')
    end

    it 'can create an order' do
      visit '/coworker_beverages/new'

      find('#coworker_beverage_beverage_id').find('option[2]').select_option
      find('#coworker_beverage_coworker_id').find('option[2]').select_option
      click_button 'Create'

      expect(page).to have_text('Order successfully added!')
    end

    it 'doesnt show coworker when they have a drink associated' do

      visit '/coworker_beverages/new'

      find('#coworker_beverage_beverage_id').find('option[2]').select_option
      find('#coworker_beverage_coworker_id').find('option[2]').select_option
      click_button 'Create'

      expect(page).to have_no_content('Anya')
    end
  end
end