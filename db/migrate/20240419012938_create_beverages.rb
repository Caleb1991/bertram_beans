class CreateBeverages < ActiveRecord::Migration[7.0]
  def change
    create_table :beverages do |t|
      t.string :name
      t.float :cost

      t.timestamps
    end
  end
end
