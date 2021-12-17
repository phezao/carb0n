class EnergyFootprint < ApplicationRecord
  belongs_to :carbon_footprint

  BOTIJAO_AVG_PRICE = 105.5459259
  ENCANADO_AVG_PRICE = 4.296851852
  CONVERSION_FACTOR_M3_TO_KG = 0.717
  CONVERSION_FACTOR_MBTU_TO_KG = 53.07
  ELECTRICITY_PRICE = 0.62
  CONVERSION_FACTOR_KWH_TO_MWH = 0.001
  ELECTRICITY_FACTOR = 0.062

  def gas_year_spending
    gas_spending * 12
  end

  def gas_price
    if gas_type == 'botijão'
      BOTIJAO_AVG_PRICE
    else
      ENCANADO_AVG_PRICE * CONVERSION_FACTOR_M3_TO_KG
    end
  end

  def gas_used
    gas_year_spending / gas_price
  end

  def gas_factor
    0.02030544 * CONVERSION_FACTOR_MBTU_TO_KG
  end

  def gas_emissions
    (gas_used * gas_factor) / 1000
  end

  def electricity_year_spending
    electricity_spending * 12
  end

  def electricity_used
    (electricity_year_spending / ELECTRICITY_PRICE) * CONVERSION_FACTOR_KWH_TO_MWH
  end

  def electricity_emissions
    electricity_used * ELECTRICITY_FACTOR
  end

  def total_emission
    gas_emissions + electricity_emissions
  end
end
