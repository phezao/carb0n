class CarbonFootprintsController < ApplicationController
  skip_before_action :authenticate_user!
  def new
    current_or_guest_user
    @last_carbon_footprint = CarbonFootprint.where(user: current_or_guest_user).last
    unless @last_carbon_footprint.nil? || @last_carbon_footprint.finished?
      redirect_to edit_carbon_footprint_path(@last_carbon_footprint)
    end
    @carbon_footprint = CarbonFootprint.new
    authorize @carbon_footprint
    render inertia: 'Calculator', props: {
      guest: current_or_guest_user.guest?,
      origin: 'new',
      weekly_km_car: '',
      vehicle_fuel: '',
      vehicle_efficiency: '',
      weekly_km_bus: '',
      weekly_km_train: '',
      weekly_km_metro: '',
      short_flights_year: '',
      long_flights_year: '',
      state_residence: '',
      gas_type: '',
      gas_spending: '',
      electricity_spending: '',
      house_size: '',
      red_meat_consumption: '',
      white_meat_consumption: '',
      dairy_consumption: '',
      eggs_consumption: '',
      clothes_spending: '',
      furniture_spending: '',
      service_spending: ''
    }
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
    render_results = lambda {
      render inertia: 'Results', props: {
        guest: current_or_guest_user.guest?,
        carbon_footprint: @carbon_footprint.total.as_json,
        transport_footprint: @carbon_footprint.transport_footprint.total_emission.as_json,
        energy_footprint: @carbon_footprint.energy_footprint.total_emission.as_json,
        product_footprint: @carbon_footprint.product_footprint.other_total_emission.as_json,
        home_footprint: @carbon_footprint.home_footprint.total_emission.as_json,
        diet_footprint: @carbon_footprint.product_footprint.diet_total_emission.as_json
      }
    }
    unless @carbon_footprint
      skip_authorization
      redirect_to root_path
    end

    if current_or_guest_user.guest && @carbon_footprint
      skip_authorization
      render_results.call
    elsif @carbon_footprint
      authorize @carbon_footprint
      render_results.call
    end
  end

  def edit
    render_calculator = lambda {
      render inertia: 'Calculator', props: {
        guest: current_or_guest_user.guest?,
        origin: 'edit',
        id: params[:id],
        weekly_km_car: @carbon_footprint.transport_footprint.weekly_km_car || '',
        vehicle_fuel: @carbon_footprint.transport_footprint.vehicle_fuel || '',
        vehicle_efficiency: @carbon_footprint.transport_footprint.vehicle_efficiency || '',
        weekly_km_bus: @carbon_footprint.transport_footprint.weekly_km_bus || '',
        weekly_km_train: @carbon_footprint.transport_footprint.weekly_km_train || '',
        weekly_km_metro: @carbon_footprint.transport_footprint.weekly_km_metro || '',
        short_flights_year: @carbon_footprint.transport_footprint.short_flights_year || '',
        long_flights_year: @carbon_footprint.transport_footprint.long_flights_year || '',

        state_residence: @carbon_footprint.energy_footprint.state_residence || '',
        gas_type: @carbon_footprint.energy_footprint.gas_type || '',
        gas_spending: @carbon_footprint.energy_footprint.gas_spending || '',
        electricity_spending: @carbon_footprint.energy_footprint.electricity_spending || '',

        house_size: @carbon_footprint.home_footprint.house_size || '',

        red_meat_consumption: @carbon_footprint.product_footprint.red_meat_consumption || '',
        white_meat_consumption: @carbon_footprint.product_footprint.white_meat_consumption || '',
        dairy_consumption: @carbon_footprint.product_footprint.dairy_consumption || '',
        eggs_consumption: @carbon_footprint.product_footprint.eggs_consumption || '',
        clothes_spending: @carbon_footprint.product_footprint.clothes_spending || '',
        furniture_spending: @carbon_footprint.product_footprint.furniture_spending || '',
        service_spending: @carbon_footprint.product_footprint.service_spending || ''
      }
    }
    @carbon_footprint = CarbonFootprint.find_by(id: params[:id], user: current_or_guest_user)
    if @carbon_footprint.nil?
      skip_authorization
      redirect_to root_path
    end

    if current_or_guest_user.guest && @carbon_footprint
      skip_authorization
      render_calculator.call
    elsif @carbon_footprint
      authorize @carbon_footprint
      render_calculator.call
    end
  end

  def update
    @carbon_footprint = CarbonFootprint.find_by(id: params[:id], user: current_or_guest_user)
    if @carbon_footprint.nil?
      skip_authorization
      redirect_to root_path
    end

    if current_or_guest_user.guest
      skip_authorization
      @carbon_footprint.update(carbon_footprint_params)
    elsif @carbon_footprint
      authorize @carbon_footprint
      @carbon_footprint.update(carbon_footprint_params)
    end
    redirect_to carbon_footprint_path(@carbon_footprint)
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
