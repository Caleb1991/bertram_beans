require 'rails_helper'

RSpec.describe Coworker, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).case_insensitive }
    it { should validate_numericality_of(:cost_burden_incurred) }
  end

  describe 'relationships' do
    it { should have_one(:coworker_beverage) }
    it { should have_one(:beverage).through(:coworker_beverage) }
  end
end
