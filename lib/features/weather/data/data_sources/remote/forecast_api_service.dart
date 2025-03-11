import 'package:dio/dio.dart';
import 'package:hydraux_weather/core/constants/constants.dart';
import 'package:hydraux_weather/features/weather/data/models/forecast_model.dart';
import 'package:retrofit/retrofit.dart';

part 'forecast_api_service.g.dart';

@RestApi(baseUrl: forecastAPIBaseURL)
abstract class ForecastApiService {
  factory ForecastApiService(Dio dio) = _ForecastApiService;

  @GET('/forecast')
  Future<HttpResponse<ForecastModel>> getForecasts({
    @Query('latitude') double? latitude,
    @Query('longitude') double? longitude,
    @Query('timezone') String? timezone,
    @Query('forecast_days') int? forecast_days,
    @Query('forecast_hours') int? forecast_hours,
    @Query('current') String? current,
    @Query('hourly') String? hourly,
    @Query('daily') String? daily,
    @Query('temperature_unit') String? temperature_unit,
    @Query('wind_speed_unit') String? wind_speed_unit,
    @Query('precipitation_unit') String? precipitation_unit,
  });
}