import 'package:hydraux_weather/features/weather/domain/value_objects/forecast_units_value_object.dart';

class ForecastUnitsModel extends ForecastUnitsValueObject{
  const ForecastUnitsModel({
    super.time,
    super.interval,
    super.temperature_2m,
    super.temperature_2m_max,
    super.temperature_2m_min,
    super.relative_humidity_2m,
    super.is_day,
    super.precipitation,
    super.precipitation_sum,
    super.precipitation_probability_max,
    super.precipitation_hours,
    super.weather_code,
    super.cloud_cover,
    super.wind_speed_10m,
    super.uv_index,
  });

  factory ForecastUnitsModel.fromJson(Map<String, dynamic> map){
    return ForecastUnitsModel(
     time: map['time'],
     interval: map['interval'],
     temperature_2m: map['temperature_2m'],
     temperature_2m_max: map['temperature_2m_max'],
     temperature_2m_min: map['temperature_2m_min'],
     relative_humidity_2m: map['relative_humidity_2m'],
     is_day: map['is_day'],
     precipitation: map['precipitation'],
     precipitation_sum: map['precipitation_sum'],
     precipitation_hours: map['precipitation_hours'],
     precipitation_probability_max: map['precipitation_probability_max'],
     weather_code: map['weather_code'],
     cloud_cover: map['cloud_cover'],
     wind_speed_10m: map['wind_speed_10m'],
     uv_index: map['uv_index'],
    );
  }
}