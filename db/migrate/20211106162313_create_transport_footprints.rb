class CreateTransportFootprints < ActiveRecord::Migration[6.1]
  def change
    create_table :transport_footprints do |t|
      t.references :carbon_footprint, null: false, foreign_key: true
      t.integer :weekly_km_car, default: 0
      t.integer :vehicle_efficiency, default: 0
      t.integer :weekly_km_bus, default: 0
      t.integer :weekly_km_metro, default: 0
      t.integer :weekly_km_train, default: 0
      t.integer :short_flights_year, default: 0
      t.integer :long_flights_year, default: 0
      t.string :vehicle_fuel, default: 'gasolina'

      t.timestamps
    end
  end
end
