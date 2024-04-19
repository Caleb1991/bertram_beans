module CostCalculator
  def self.calculate_grand_total
    Coworker.all.joins(:beverage).pluck(:cost).sum
  end
end
