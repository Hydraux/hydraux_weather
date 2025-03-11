abstract class ForecastLayoutEvent {
  const ForecastLayoutEvent();
}

class SelectForecast extends ForecastLayoutEvent {
  final int forecastIndex;
  const SelectForecast({required this.forecastIndex});
}

class DeselectForecast extends ForecastLayoutEvent{}