class CreateProductFootprints < ActiveRecord::Migration[6.1]
  def change
    create_table :product_footprints do |t|
      t.references :carbon_footprint, null: false, foreign_key: true
      t.integer :red_meat_consumption
      t.integer :dairy_consumption
      t.integer :white_meat_consumption
      t.integer :eggs_consumption
      t.integer :clothes_spending
      t.integer :furniture_spending
      t.integer :service_spending

      t.timestamps
    end
  end
end
