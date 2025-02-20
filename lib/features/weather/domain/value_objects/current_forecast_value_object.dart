import 'package:equatable/equatable.dart';

class CurrentForecastValueObject extends Equatable {
  final String? time;
  final int? interval;
  final double? temperature_2m;
  final int? relative_humidity_2m;
  final int? is_day;
  final double? precipitation;
  final int? weather_code;
  final int? cloud_cover;
  final double? wind_speed_10m;

  const CurrentForecastValueObject({
    this.time,
    this.interval,
    this.temperature_2m,
    this.relative_humidity_2m,
    this.is_day,
    this.precipitation,
    this.weather_code,
    this.cloud_cover,
    this.wind_speed_10m
  });

  @override
  List<Object?> get props {
    return [
      time,
      interval,
      temperature_2m,
      relative_humidity_2m,
      is_day,
      precipitation,
      weather_code,
      cloud_cover,
      wind_speed_10m
    ];
  }
}