import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hydraux_weather/core/resources/data_state.dart';
import 'package:hydraux_weather/features/weather/domain/usecases/get_forecast.dart';
import 'package:hydraux_weather/features/weather/presentation/bloc/forecast/remote/remote_forecast_event.dart';
import 'package:hydraux_weather/features/weather/presentation/bloc/forecast/remote/remote_forecast_state.dart';

class RemoteForecastBloc
    extends Bloc<RemoteForecastEvent, RemoteForecastState> {
  final GetForecastUseCase _getForecastUseCase;

  RemoteForecastBloc(this._getForecastUseCase)
    : super(const RemoteForecastsLoading()) {
    on<GetForecasts>(onGetForecasts);
  }

  void onGetForecasts(
    GetForecasts event,
    Emitter<RemoteForecastState> emit,
  ) async {
    try {
      emit(RemoteForecastsLoading());
      print("Getting forecasts");
      await Geolocator.requestPermission();

      final dataState = await _getForecastUseCase();

      if (dataState is DataSuccess) {
        emit(RemoteForecastsDone(dataState.data!));
      }

      if (dataState is DataFailed) {
        emit(RemoteForecastsError(dataState.error!));
      }
    } on Exception catch (_) {
      print("Permissions error");
      emit(PermissionsError());
    }
  }
}
