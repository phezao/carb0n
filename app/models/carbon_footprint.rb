class CarbonFootprint < ApplicationRecord
  belongs_to :user
  has_one :transport_footprint, dependent: :destroy
  accepts_nested_attributes_for :transport_footprint

  has_one :energy_footprint, dependent: :destroy
  accepts_nested_attributes_for :energy_footprint

  has_one :home_footprint, dependent: :destroy
  accepts_nested_attributes_for :home_footprint

  has_one :product_footprint, dependent: :destroy
  accepts_nested_attributes_for :product_footprint

  def total
    transport_footprint.total_emission + energy_footprint.total_emission + home_footprint.total_emission + product_footprint.total_emission
  end
end
