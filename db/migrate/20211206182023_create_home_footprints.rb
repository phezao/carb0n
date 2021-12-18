class CreateHomeFootprints < ActiveRecord::Migration[6.1]
  def change
    create_table :home_footprints do |t|
      t.references :carbon_footprint, null: false, foreign_key: true
      t.integer :house_size

      t.timestamps
    end
  end
end
