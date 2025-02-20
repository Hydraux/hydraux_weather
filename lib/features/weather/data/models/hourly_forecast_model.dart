import 'package:hydraux_weather/features/weather/domain/value_objects/hourly_forecast_value_object.dart';

class HourlyForecastModel extends HourlyForecastValueObject{
  const HourlyForecastModel({
    super.time,
    super.temperature_2m,
    super.uv_index,
  });

  factory HourlyForecastModel.fromJson(Map<String, dynamic> map){
    return HourlyForecastModel(
      time: map['time'],
      temperature_2m: map['temperature_2m'],
      uv_index: map['uv_index'],
    );
  }
}