import 'package:hydraux_weather/features/weather/data/models/current_forecast_model.dart';
import 'package:hydraux_weather/features/weather/data/models/daily_forecast_model.dart';
import 'package:hydraux_weather/features/weather/data/models/forecast_units_model.dart';
import 'package:hydraux_weather/features/weather/data/models/hourly_forecast_model.dart';
import 'package:hydraux_weather/features/weather/domain/value_objects/forecast_value_object.dart';

class ForecastModel extends ForecastValueObject{
  const ForecastModel({
    super.current_units,
    super.current,
    super.hourly_units,
    super.hourly,
    super.daily_units,
    super.daily,
  });

  factory ForecastModel.fromJson(Map<String, dynamic> map){
   return ForecastModel(
      current_units: ForecastUnitsModel.fromJson(map['current_units']),
      current: CurrentForecastModel.fromJson(map['current']),
      hourly_units: ForecastUnitsModel.fromJson(map['hourly_units']),
      hourly: HourlyForecastModel.fromJson(map['hourly']),
      daily_units: ForecastUnitsModel.fromJson(map['daily_units']),
      daily: DailyForecastModel.fromJson(map['daily'])
    );
  }
}