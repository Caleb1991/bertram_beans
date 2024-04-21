require 'rails_helper'

RSpec.describe Beverage, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).case_insensitive }
    it { should validate_presence_of(:cost) }
    it { should validate_numericality_of(:cost) }
  end

  describe 'relationships' do
    it { should have_many(:coworker_beverages) }
  end
end