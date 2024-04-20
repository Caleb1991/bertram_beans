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
      expect(CostCalculator.calculate_grand_total).to eq(56)
    end
  end

  describe '#determine_payer' do
    it 'returns the coworker object of whose turn it is to pay' do 
      expect(CostCalculator.determine_payer).to eq(Coworker.find_by(name: 'Becky'))
      expect(CostCalculator.determine_payer).to eq(Coworker.find_by(name: 'Yor'))
      expect(CostCalculator.determine_payer).to eq(Coworker.find_by(name: 'Loid'))
      expect(CostCalculator.determine_payer).to eq(Coworker.find_by(name: 'Bondo'))
      expect(CostCalculator.determine_payer).to eq(Coworker.find_by(name: 'Anya'))
      expect(CostCalculator.determine_payer).to eq(Coworker.find_by(name: 'Bob'))
      expect(CostCalculator.determine_payer).to eq(Coworker.find_by(name: 'Becky'))
      expect(CostCalculator.determine_payer).to eq(Coworker.find_by(name: 'Yor'))
      expect(CostCalculator.determine_payer).to eq(Coworker.find_by(name: 'Loid'))
      expect(CostCalculator.determine_payer).to eq(Coworker.find_by(name: 'Jeremy'))
    end
  end
end