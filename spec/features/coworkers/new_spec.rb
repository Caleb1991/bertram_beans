require 'rails_helper'

RSpec.describe 'coworker', type: :feature do
  describe '/new' do
    it 'contains a form for adding a coworker' do
      visit '/coworkers/new'

      expect(page).to have_field(:coworker_name)
      expect(page).to have_button('Create')
    end
  end
end