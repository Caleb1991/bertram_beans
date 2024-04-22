class CoworkerBeverage < ApplicationRecord
  belongs_to :beverage
  belongs_to :coworker

  def self.calculate_grand_total
    Coworker.all.joins(:beverage).pluck(:cost).sum
  end

  def self.determine_payer
    if self.all.present?
      total = calculate_grand_total
      coworkers = Coworker.all.joins(:beverage)
      payer = coworkers.all? { |worker| worker.cost_burden_incurred == 0 } ? coworkers.max_by { |worker| worker.beverage.cost } : coworkers.max_by { |worker| worker.cost_burden_incurred }
      payer.update!(cost_burden_incurred: payer.cost_burden_incurred -= total)

      coworkers.each do |worker|
        worker.update(cost_burden_incurred: worker.cost_burden_incurred += worker.beverage.cost)
      end
      payer.name
    else
      nil
    end
  end
end