require 'rails_helper'

RSpec.describe 'coworker', type: :feature do
  describe '/new' do
    it 'contains a form for adding a coworker' do
      visit '/coworkers/new'

      expect(page).to have_field(:coworker_name)
      expect(page).to have_button('Create')
    end
  end

  it 'can create a coworker' do
    visit '/coworkers/new'

    fill_in :coworker_name, with: 'Peanut'
    click_button 'Create'
    expect(page).to have_text('Coworker successfully added!')
  end

  it 'returns an error when coworker name exists' do
    Coworker.create!(name: 'Peanut')
    visit '/coworkers/new'

    fill_in :coworker_name, with: 'peanut'
    click_button 'Create'
    expect(page).to have_text('Name has already been taken')
  end
end