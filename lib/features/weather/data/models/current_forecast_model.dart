import 'package:hydraux_weather/features/weather/domain/value_objects/current_forecast_value_object.dart';

class CurrentForecastModel extends CurrentForecastValueObject{
  const CurrentForecastModel({
    super.time,
    super.interval,
    super.temperature_2m,
    super.relative_humidity_2m,
    super.is_day,
    super.precipitation,
    super.weather_code,
    super.cloud_cover,
    super.wind_speed_10m,
  });

  factory CurrentForecastModel.fromJson(Map<String, dynamic> map){
    return CurrentForecastModel(
     time: map['time'],
     interval: map['interval'],
     temperature_2m: map['temperature_2m'],
     relative_humidity_2m: map['relative_humidity_2m'],
     is_day: map['is_day'],
     precipitation: map['precipitation'],
     weather_code: map['weather_code'],
     cloud_cover: map['cloud_cover'],
     wind_speed_10m: map['wind_speed_10m'],
    );
  }
}