Coworker.destroy_all
Beverage.destroy_all
CoworkerBeverage.destroy_all

beverage_cost = 2.00

['Cappuccino', 'Americano', 'Tea, Earl Grey, Hot', 'Cappucino', 'Green Tea', 'Cold Brew', 'Mocha'].each do |beverage_name|
  Beverage.create!(name: beverage_name, cost: beverage_cost)
  beverage_cost += 2.00
end

['Jeremy', 'Bob', 'Anya', 'Bondo', 'Loid', 'Yor', 'Becky'].each do |coworker_name|
  Coworker.create!(name: coworker_name)
end

7.times do |i|
  CoworkerBeverage.create!(beverage_id: Beverage.all[i].id, coworker_id: Coworker.all[i].id)
end