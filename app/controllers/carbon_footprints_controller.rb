class CarbonFootprintsController < ApplicationController
  skip_before_action :authenticate_user!
  def new
    current_or_guest_user
    @carbon_footprint = CarbonFootprint.new
    authorize @carbon_footprint
    render inertia: 'Calculator', props: {}
  end

  def create
    @carbon_footprint = CarbonFootprint.new(carbon_footprint_params)
    authorize @carbon_footprint
    if @carbon_footprint.save
      redirect_to carbon_footprint_path(@carbon_footprint)
    else
      flash[:error] = 'Something went wrong'
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @carbon_footprint = CarbonFootprint.find_by(id: params[:id], user: current_or_guest_user)
    if current_or_guest_user.guest
      skip_authorization
      redirect_to root_path unless @carbon_footprint
    elsif @carbon_footprint
      authorize @carbon_footprint
      render inertia: 'Results', props: {
        carbon_footprint: @carbon_footprint.total.as_json,
        transport_footprint: @carbon_footprint.transport_footprint.total_emission.as_json,
        energy_footprint: @carbon_footprint.energy_footprint.total_emission.as_json,
        product_footprint: @carbon_footprint.product_footprint.other_total_emission.as_json,
        home_footprint: @carbon_footprint.home_footprint.total_emission.as_json,
        diet_footprint: @carbon_footprint.product_footprint.diet_total_emission.as_json
      }
    else
      skip_authorization
      redirect_to root_path
    end
  end

  private

  def carbon_footprint_params
    safe_params = params.require(:carbon_footprint)
                        .permit(
                          :finished?,
                          transport_footprint_attributes: %i[
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
    safe_params[:user_id] = current_or_guest_user.id
    safe_params
  end
end
