class CreateCoworkers < ActiveRecord::Migration[7.0]
  def change
    create_table :coworkers do |t|
      t.string :name

      t.timestamps
    end
  end
end
