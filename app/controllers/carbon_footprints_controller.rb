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
      flash[:success] = 'Object successfully created'
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
    else
      skip_authorization
      redirect_to root_path
    end
  end

  private

  def carbon_footprint_params
    safe_params = params.require(:carbon_footprint)
                        .permit(transport_footprint_attributes:
      %i[
        weekly_km_car
        weekly_km_bus
        weekly_km_metro
        weekly_km_train
        short_flights_year
        long_flights_year
        vehicle_efficiency
        vehicle_fuel
      ])

    safe_params[:user_id] = current_or_guest_user.id
    safe_params
  end
end
