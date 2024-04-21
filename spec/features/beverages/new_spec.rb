require 'rails_helper'

RSpec.describe Beverage, type: :feature do
  describe '/new' do
    it 'contains a form for adding a beverage' do
      visit '/beverages/new'

      expect(page).to have_field(:beverage_name)
      expect(page).to have_field(:beverage_cost)
      expect(page).to have_button('Create')
    end
  end
end