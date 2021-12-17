class CreateEnergyFootprints < ActiveRecord::Migration[6.1]
  def change
    create_table :energy_footprints do |t|
      t.references :carbon_footprint, null: false, foreign_key: true
      t.string :state_residence
      t.string :gas_type
      t.integer :gas_spending
      t.integer :electricity_spending

      t.timestamps
    end
  end
end
