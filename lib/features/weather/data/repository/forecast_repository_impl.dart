import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hydraux_weather/core/constants/constants.dart';
import 'package:hydraux_weather/core/resources/data_state.dart';
import 'package:hydraux_weather/core/util/geolocation.dart';
import 'package:hydraux_weather/features/weather/data/data_sources/remote/forecast_api_service.dart';
import 'package:hydraux_weather/features/weather/data/models/forecast_model.dart';
import 'package:hydraux_weather/features/weather/domain/repositories/forecast_repository.dart';

class ForecastRepositoryImpl implements ForecastRepository {
  final ForecastApiService _forecastApiService;

  ForecastRepositoryImpl(this._forecastApiService);

  @override
  Future<DataState<ForecastModel>> getForecasts() async {
    try {
      final Position position = await determinePosition();
      final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
      final httpResponse = await _forecastApiService.getForecasts(
        latitude: position.latitude,
        longitude: position.longitude,
        timezone: currentTimeZone,
        forecast_days: forecast_days,
        current: current,
        hourly: hourly,
        daily: daily,
        temperature_unit: temperature_unit,
        wind_speed_unit: wind_speed_unit,
        precipitation_unit: precipitation_unit,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioException(
            error: httpResponse.response.statusCode,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
