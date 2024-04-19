class CreateCoworkerBeverages < ActiveRecord::Migration[7.0]
  def change
    create_table :coworker_beverages do |t|
      t.references :beverage, null: false, foreign_key: true
      t.references :coworker, null: false, foreign_key: true

      t.timestamps
    end
  end
end
