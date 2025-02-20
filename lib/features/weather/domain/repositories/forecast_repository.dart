import 'package:hydraux_weather/core/resources/data_state.dart';
import 'package:hydraux_weather/features/weather/domain/value_objects/forecast_value_object.dart';

abstract class ForecastRepository {
  Future<DataState<ForecastValueObject>> getForecasts();
}