require 'rails_helper'

RSpec.describe Beverage, type: :feature do
  describe '/new' do
    it 'contains a form for adding a beverage' do
      visit '/beverages/new'

      expect(page).to have_field(:beverage_name)
      expect(page).to have_field(:beverage_cost)
      expect(page).to have_button('Create')
    end

    it 'can create a beverage' do
      visit '/beverages/new'

      fill_in :beverage_name, with: 'Tea, Earl Grey, Hot'
      fill_in :beverage_cost, with: 1.07
      click_button 'Create'

      expect(page).to have_text('Beverage successfully added!')
    end

    it 'returns an error when beverage name exists' do
    Beverage.create!(name: 'Tea, Earl Grey, Hot', cost: 1.10)
    visit '/beverages/new'

    fill_in :beverage_name, with: 'Tea, Earl Grey, Hot'
    fill_in :beverage_cost, with: 1.07
    click_button 'Create'

    expect(page).to have_text('Name has already been taken')
    end
  end
end