class AddCostBurdenIncurredToCoworker < ActiveRecord::Migration[7.0]
  def change
    add_column :coworkers, :cost_burden_incurred, :float, default: 0
  end
end
