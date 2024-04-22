require 'rails_helper'

RSpec.describe CoworkerBeverage, type: :model do
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

  describe 'relationships' do
    it { should belong_to(:beverage) }
    it { should belong_to(:coworker) }
  end

  describe 'self#calculate_grand_total' do
    it 'returns the grand total of all coworkers beverages' do
      expect(CoworkerBeverage.calculate_grand_total).to eq(56)
    end
  end

  describe 'self#determine_payer' do
    it 'returns the coworker object of whose turn it is to pay' do 
      expect(CoworkerBeverage.determine_payer).to eq('Becky')
      expect(CoworkerBeverage.determine_payer).to eq('Yor')
      expect(CoworkerBeverage.determine_payer).to eq('Loid')
      expect(CoworkerBeverage.determine_payer).to eq('Bondo')
      expect(CoworkerBeverage.determine_payer).to eq('Anya')
      expect(CoworkerBeverage.determine_payer).to eq('Bob')
      expect(CoworkerBeverage.determine_payer).to eq('Becky')
      expect(CoworkerBeverage.determine_payer).to eq('Yor')
      expect(CoworkerBeverage.determine_payer).to eq('Loid')
      expect(CoworkerBeverage.determine_payer).to eq('Jeremy')
    end
  end
end