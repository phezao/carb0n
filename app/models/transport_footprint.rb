class TransportFootprint < ApplicationRecord
  belongs_to :carbon_footprint

  FUEL_VALUES = {
    'gasolina': {
      'emission_gallon': 8780,
      'wtp_emission': 613.28
    },
    'diesel': {
      'emission_gallon': 10_210,
      'wtp_emission': 609.86
    },
    'etanol': {
      'emission_gallon': 5750,
      'wtp_emission': 544.88
    },
    'gnv': {
      'emission_gallon': 4500,
      'wtp_emission': 882.35
    }
  }
  BUS_EMISSION_FACTOR = 300
  TRAIN_EMISSION_FACTOR = 165
  METRO_EMISSION_FACTOR = 160
  AVG_DISTANCE_OF_SHORT_FLIGHT = 950
  AVG_DISTANCE_OF_LONG_FLIGHT = 2250
  SHORT_FLIGHT_EMISSION_FACTOR = 204
  LONG_FLIGHT_EMISSION_FACTOR = 181
  WTP_FACTOR = 2

  def weekly_to_yearly_km(vehicle)
    vehicle * 52.1429
  end

  def yearly_km_to_miles(yearly_km)
    yearly_km * 0.621371
  end

  def vehicle_efficiency_miles_gallon
    vehicle_efficiency * 2.35215
  end

  def carbon_footprint_gallon
    FUEL_VALUES.stringify_keys[vehicle_fuel][:emission_gallon]
  end

  def yearly_km_car
    weekly_to_yearly_km(weekly_km_car)
  end

  def yearly_miles_car
    yearly_km_to_miles(yearly_km_car)
  end

  def direct_tailpipe_emission
    yearly_miles_car / (vehicle_efficiency_miles_gallon * carbon_footprint_gallon)
  end

  def yearly_liters_consumed
    yearly_km_car / vehicle_efficiency
  end

  def wtp_fuel_emission
    FUEL_VALUES.stringify_keys[vehicle_fuel][:wtp_emission]
  end

  def indirect_wtp_emission
    (wtp_fuel_emission * yearly_liters_consumed) / (1000 * 1000)
  end

  def avg_lifetime_miles_driven
    160_000
  end

  def emission_intesity_per_mile
    56
  end

  def vehicle_manufacturing_emissions
    (emission_intesity_per_mile * yearly_miles_car) / (1000 * 1000)
  end

  def bus_emission
    yearly_km_bus_emission = weekly_to_yearly_km(weekly_km_bus)
    yearly_miles_bus_emission = yearly_km_to_miles(yearly_km_bus_emission)
    (yearly_miles_bus_emission * BUS_EMISSION_FACTOR) / (1000 * 1000)
  end

  def train_emission
    yearly_km_train_emission = weekly_to_yearly_km(weekly_km_train)
    yearly_miles_train_emission = yearly_km_to_miles(yearly_km_train_emission)
    (yearly_miles_train_emission * TRAIN_EMISSION_FACTOR) / (1000 * 1000)
  end

  def metro_emission
    yearly_km_metro_emission = weekly_to_yearly_km(weekly_km_metro)
    yearly_miles_metro_emission = yearly_km_to_miles(yearly_km_metro_emission)
    (yearly_miles_metro_emission * METRO_EMISSION_FACTOR) / (1000 * 1000)
  end

  def short_flight_emission
    short_flights_distance_traveled = AVG_DISTANCE_OF_SHORT_FLIGHT * short_flights_year
    (short_flights_distance_traveled.to_f * SHORT_FLIGHT_EMISSION_FACTOR * WTP_FACTOR) / (1000 * 1000)
  end

  def long_flight_emission
    long_flights_distance_traveled = AVG_DISTANCE_OF_LONG_FLIGHT * long_flights_year
    (long_flights_distance_traveled.to_f * LONG_FLIGHT_EMISSION_FACTOR * WTP_FACTOR) / (1000 * 1000)
  end

  def total_emission
    direct_tailpipe_emission + indirect_wtp_emission + vehicle_manufacturing_emissions + bus_emission + train_emission + metro_emission + short_flight_emission + long_flight_emission
  end
end
