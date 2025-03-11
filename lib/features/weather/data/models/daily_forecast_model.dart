import 'package:hydraux_weather/features/weather/domain/value_objects/daily_forecast_value_object.dart';

class DailyForecastModel extends DailyForecastValueObject{
  const DailyForecastModel({
    super.precipitation_hours,
    super.precipitation_probability_max,
    super.precipitation_sum,
    super.time,
    super.temperature_2m_max,
    super.temperature_2m_min,
    super.weather_code,
  });

  factory DailyForecastModel.fromJson(Map<String, dynamic> map){
    return DailyForecastModel(
      precipitation_hours: map['precipitation_hours'],
      precipitation_probability_max: map['precipitation_probability_max'],
      precipitation_sum: map['precipitation_sum'],
      time: map['time'],
      temperature_2m_max: map['temperature_2m_max'],
      temperature_2m_min: map['temperature_2m_min'],
      weather_code: map['weather_code'],
    );
  }
}