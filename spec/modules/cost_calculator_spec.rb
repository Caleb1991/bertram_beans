require 'rails_helper'

RSpec.describe CostCalculator do
  before :each do
    beverage_cost = 2.00
    ['Latte', 'Tea, Earl Grey, Hot', 'Mocha', 'Americano', 'Cappucino', 'Green Tea', 'Cold Brew'].each do |beverage_name|
      Beverage.create!(name: beverage_name, cost: beverage_cost)
      beverage_cost += 2.00
    end

    ['Jeremy', 'Bob', 'Anya', 'Bondo', 'Loid', 'Yor', 'Becky'].each do |coworker_name|
      Coworker.create!(name: coworker_name)
    end

    7.times do |i|
      CoworkerBeverage.create!(beverage_id: Beverage.all[i].id, coworker_id: Coworker.all[i].id)
    end
  end

  describe '#calculate_grand_total' do
    it 'returns the grand total of all coworkers beverages' do
      expect(CostCalculator.calculate_grand_total).to_eq(56)
    end
  end
end