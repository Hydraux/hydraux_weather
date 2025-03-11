import 'package:equatable/equatable.dart';

class HourlyForecastValueObject extends Equatable {
  final List<dynamic>? time;
  final List<dynamic>? temperature_2m;
  final List<dynamic>? precipitation_probability;
  final List<dynamic>? precipitation;
  final List<dynamic>? relative_humidity_2m;
  final List<dynamic>? weather_code;

  const HourlyForecastValueObject({
    this.time,
    this.temperature_2m,
    this.precipitation_probability,
    this.precipitation,
    this.relative_humidity_2m,
    this.weather_code,
  });

  @override
  List<Object?> get props {
    return [
      time,
      temperature_2m,
      precipitation_probability,
      precipitation,
      relative_humidity_2m,
      weather_code,
    ];
  }
}