require 'rails_helper'

RSpec.describe CoworkerBeverage, type: :model do
  describe 'relationships' do
    it { should belong_to(:beverage) }
    it { should belong_to(:coworker) }
  end
end