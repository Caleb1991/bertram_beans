require 'rails_helper'

RSpec.describe 'home', type: :feature do
  describe '/' do
    it 'contains a link for adding a cowrker' do
      visit '/'

      expect(page).to have_link('Add Coworker')
    end
  end
end