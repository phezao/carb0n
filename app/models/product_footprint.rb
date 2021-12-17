class ProductFootprint < ApplicationRecord
  belongs_to :carbon_footprint

  DIET = {
    'red_meat': {
      kcal_portion: 431,
      emission_factor: 6.09
    },
    'dairy': {
      kcal_portion: 305,
      emission_factor: 4
    },
    'white_meat': {
      kcal_portion: 274,
      emission_factor: 4.99
    },
    'eggs': {
      kcal_portion: 165,
      emission_factor: 4.27
    }
  }

  PURCHASING_POWER_PARITY_FACTOR = 2.362
  CLOTHING_EMISSIONS_FACTOR = 750
  FURNITURE_EMISSIONS_FACTOR = 614
  SERVICES_EMISSIONS_FACTOR = 507

  def red_meat_kcal_year
    (red_meat_consumption * 52.1429) * DIET[:red_meat][:kcal_portion]
  end

  def white_meat_kcal_year
    (white_meat_consumption * 52.1429) * DIET[:white_meat][:kcal_portion]
  end

  def dairy_kcal_year
    (dairy_consumption * 52.1429) * DIET[:dairy][:kcal_portion]
  end

  def eggs_kcal_year
    (eggs_consumption * 52.1429) * DIET[:eggs][:kcal_portion]
  end

  def red_meat_emissions
    red_meat_kcal_year * DIET[:red_meat][:emission_factor] / (1000 * 1000)
  end

  def white_meat_emissions
    white_meat_kcal_year * DIET[:white_meat][:emission_factor] / (1000 * 1000)
  end

  def dairy_emissions
    dairy_kcal_year * DIET[:dairy][:emission_factor] / (1000 * 1000)
  end

  def eggs_emissions
    eggs_kcal_year * DIET[:eggs][:emission_factor] / (1000 * 1000)
  end

  def clothes_yearly_spending
    clothes_spending * 12
  end

  def clothes_yearly_spending_dolars
    clothes_yearly_spending * PURCHASING_POWER_PARITY_FACTOR
  end

  def furniture_yearly_spending
    furniture_spending * 12
  end

  def furniture_yearly_spending_dolars
    furniture_yearly_spending * PURCHASING_POWER_PARITY_FACTOR
  end

  def services_yearly_spending
    service_spending * 12
  end

  def services_yearly_spending_dolars
    services_yearly_spending * PURCHASING_POWER_PARITY_FACTOR
  end

  def clothes_emission
    (clothes_yearly_spending_dolars * CLOTHING_EMISSIONS_FACTOR) / (1000 * 1000)
  end

  def furniture_emission
    (furniture_yearly_spending_dolars * FURNITURE_EMISSIONS_FACTOR) / (1000 * 1000)
  end

  def services_emission
    (services_yearly_spending_dolars * SERVICES_EMISSIONS_FACTOR) / (1000 * 1000)
  end

  def diet_total_emission
    red_meat_emissions + white_meat_emissions + dairy_emissions + eggs_emissions
  end

  def other_total_emission
    clothes_emission + furniture_emission + services_emission
  end

  def total_emission
    diet_total_emission + other_total_emission
  end
end
