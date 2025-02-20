import 'package:equatable/equatable.dart';

class HourlyForecastValueObject extends Equatable {
  final List<dynamic>? time;
  final List<dynamic>? temperature_2m;
  final List<dynamic>? uv_index;

  const HourlyForecastValueObject({
    this.time,
    this.temperature_2m,
    this.uv_index,
  });

  @override
  List<Object?> get props {
    return [
      time,
      temperature_2m,
      uv_index,
    ];
  }
}