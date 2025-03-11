import 'package:hydraux_weather/features/weather/domain/value_objects/hourly_forecast_value_object.dart';

class HourlyForecastModel extends HourlyForecastValueObject{
  const HourlyForecastModel({
    super.time,
    super.temperature_2m,
    super.precipitation_probability,
    super.precipitation,
    super.relative_humidity_2m,
    super.weather_code
  });

  factory HourlyForecastModel.fromJson(Map<String, dynamic> map){
    return HourlyForecastModel(
      time: map['time'],
      temperature_2m: map['temperature_2m'],
      precipitation_probability: map['precipitation_probability'],
      precipitation: map['precipitation'],
      relative_humidity_2m: map['relative_humidity_2m'],
      weather_code: map['weather_code'],
    );
  }
}