class HomeFootprint < ApplicationRecord
  belongs_to :carbon_footprint

  def house_factor
    (930 / 0.092903) / (1000 * 1000)
  end

  def total_emission
    house_size * house_factor
  end
end
