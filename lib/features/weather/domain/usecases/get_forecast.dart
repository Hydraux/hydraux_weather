import 'package:hydraux_weather/core/resources/data_state.dart';
import 'package:hydraux_weather/core/usecases/usecase.dart';
import 'package:hydraux_weather/features/weather/domain/repositories/forecast_repository.dart';
import 'package:hydraux_weather/features/weather/domain/value_objects/forecast_value_object.dart';

class GetForecastUseCase implements UseCase<DataState<ForecastValueObject>, void>{
  final ForecastRepository _forecastRepository;

  GetForecastUseCase(this._forecastRepository);

  @override
  Future<DataState<ForecastValueObject>> call({void params}) {
    return _forecastRepository.getForecasts();
  }
  
}