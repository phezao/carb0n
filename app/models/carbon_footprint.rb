class CarbonFootprint < ApplicationRecord
  belongs_to :user
  has_one :transport_footprint, dependent: :destroy
  accepts_nested_attributes_for :transport_footprint

  def total
    transport_footprint.total_emission
  end
end
