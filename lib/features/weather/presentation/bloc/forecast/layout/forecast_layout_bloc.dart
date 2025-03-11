import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydraux_weather/features/weather/presentation/bloc/forecast/layout/forecast_layout_event.dart';
import 'package:hydraux_weather/features/weather/presentation/bloc/forecast/layout/forecast_layout_state.dart';

class ForecastLayoutBloc
    extends Bloc<ForecastLayoutEvent, ForecastLayoutState> {

  ForecastLayoutBloc(super.initialState){
    on<SelectForecast>(onSelectForecast);
    on<DeselectForecast>(onDeselectForecast);
  }

  void onSelectForecast(
    SelectForecast event,
    Emitter<ForecastLayoutState> emit,
  ) {
    emit(DailyForecastSelected(event.forecastIndex));
  }

  void onDeselectForecast(
    DeselectForecast event,
    Emitter<ForecastLayoutState> emit,
  ) {
    emit(NoForecastSelected());
  } 
}
