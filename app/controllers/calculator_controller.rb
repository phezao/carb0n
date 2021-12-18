class CalculatorController < ApplicationController
  include Wicked::Wizard

  steps :transport_footprint, :energy_footprint, :home_footprint, :product_footprint

  def show
    @carbon_footprint = CarbonFootprint.find(params[:carbon_footprint_id])
    render_wizard
  end

  def update
    @carbon_footprint = CarbonFootprint.find(params[:carbon_footprint_id])
    @carbon_footprint.update_attributes(params[:product])
    render_wizard @carbon_footprint
  end

  def create
    @carbon_footprint = CarbonFootprint.create(user: current_or_guest_user)
    authorize @carbon_footprint
    redirect_to wizard_path(steps.first, carbon_footprint_id: @carbon_footprint.id)
  end

  private

  def carbon_footprints_params
    params.require(:carbon_footprint).permit(
      transport_footprint_attributes:
       %i[
         weekly_km_car
         weekly_km_bus
         weekly_km_metro
         weekly_km_train
         short_flights_year
         long_flights_year
         vehicle_efficiency
         vehicle_fuel
       ],
      energy_footprint_attributes: %i[
        state_residence
        gas_type
        gas_spending
        electricity_spending
      ],
      home_footprint_attributes: %i[
        house_size
      ],
      product_footprint_attributes: %i[
        red_meat_consumption
        white_meat_consumption
        dairy_consumption
        eggs_consumption
        clothes_spending
        furniture_spending
        service_spending
      ]
    )
  end
end
