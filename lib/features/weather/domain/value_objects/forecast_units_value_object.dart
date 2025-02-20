import 'package:equatable/equatable.dart';

class ForecastUnitsValueObject extends Equatable{
  final String? cloud_cover;
  final String? interval;
  final String? is_day;
  final String? temperature_2m;
  final String? temperature_2m_max;
  final String? temperature_2m_min;
  final String? time;
  final String? precipitation;
  final String? precipitation_sum;
  final String? precipitation_hours;
  final String? precipitation_probability_max;
  final String? relative_humidity_2m;
  final String? uv_index;
  final String? weather_code;
  final String? wind_speed_10m;

  const ForecastUnitsValueObject({
    this.cloud_cover,
    this.interval,
    this.is_day,
    this.temperature_2m,
    this.temperature_2m_max,
    this.temperature_2m_min,
    this.time,
    this.precipitation,
    this.precipitation_hours,
    this.precipitation_sum,
    this.precipitation_probability_max,
    this.relative_humidity_2m,
    this.uv_index,
    this.weather_code,
    this.wind_speed_10m
  });

  @override
  List<Object?> get props {
    return [
      time,
      interval,
      temperature_2m,
      temperature_2m_max,
      temperature_2m_min,
      relative_humidity_2m,
      is_day,
      precipitation,
      precipitation_hours,
      precipitation_probability_max,
      precipitation_sum,
      weather_code,
      cloud_cover,
      wind_speed_10m,
      uv_index,
    ];
  }
}