import 'package:equatable/equatable.dart';

class DailyForecastValueObject extends Equatable {
  final List<dynamic>? precipitation_hours;
  final List<dynamic>? precipitation_probability_max;
  final List<dynamic>? precipitation_sum;
  final List<dynamic>? time;
  final List<dynamic>? temperature_2m_max;
  final List<dynamic>? temperature_2m_min;


  const DailyForecastValueObject({
    this.precipitation_hours,
    this.precipitation_probability_max,
    this.precipitation_sum,
    this.time,
    this.temperature_2m_max,
    this.temperature_2m_min,
  });

  @override
  List<Object?> get props {
    return [
      precipitation_hours,
      precipitation_probability_max,
      precipitation_sum,
      time,
      temperature_2m_max,
    ];
  }
}