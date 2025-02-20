import 'package:equatable/equatable.dart';
import 'package:hydraux_weather/features/weather/domain/value_objects/current_forecast_value_object.dart';
import 'package:hydraux_weather/features/weather/domain/value_objects/daily_forecast_value_object.dart';
import 'package:hydraux_weather/features/weather/domain/value_objects/forecast_units_value_object.dart';
import 'package:hydraux_weather/features/weather/domain/value_objects/hourly_forecast_value_object.dart';

class ForecastValueObject extends Equatable {
  final ForecastUnitsValueObject? current_units;
  final CurrentForecastValueObject? current;
  final ForecastUnitsValueObject? hourly_units;
  final HourlyForecastValueObject? hourly;
  final ForecastUnitsValueObject? daily_units;
  final DailyForecastValueObject? daily;

  const ForecastValueObject({
    this.current_units,
    this.current,
    this.hourly_units,
    this.hourly,
    this.daily_units,
    this.daily
  });

  @override
  List<Object?> get props {
    return [
      current_units,
      current,
      hourly_units,
      hourly,
      daily_units,
      daily
    ];
  }
}