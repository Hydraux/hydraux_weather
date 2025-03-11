
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydraux_weather/features/weather/domain/value_objects/forecast_units_value_object.dart';
import 'package:hydraux_weather/features/weather/domain/value_objects/hourly_forecast_value_object.dart';
import 'package:hydraux_weather/features/weather/presentation/bloc/forecast/layout/forecast_layout_bloc.dart';
import 'package:hydraux_weather/features/weather/presentation/bloc/forecast/layout/forecast_layout_event.dart';
import 'package:hydraux_weather/features/weather/presentation/bloc/forecast/layout/forecast_layout_state.dart';
import 'package:hydraux_weather/features/weather/presentation/utils/forecast_utils.dart';
import 'package:intl/intl.dart';

class HourlyForecastCardExpanded extends StatelessWidget {
  const HourlyForecastCardExpanded({
    super.key,
    required HourlyForecastValueObject hourly,
    required ForecastUnitsValueObject hourlyUnits,
    required int index,
  }) : _hourly = hourly,
       _hourlyUnits = hourlyUnits,
       _index = index;

  final HourlyForecastValueObject _hourly;
  final ForecastUnitsValueObject _hourlyUnits;
  final int _index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForecastLayoutBloc, ForecastLayoutState>(
      builder: (context, state) {
        final isSelected = state.selectedIndex == _index;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 2),
          child: GestureDetector(
            onTap: () => {
              if (isSelected)
                {
                  BlocProvider.of<ForecastLayoutBloc>(
                    context,
                  ).add(DeselectForecast()),
                }
              else
                {
                  BlocProvider.of<ForecastLayoutBloc>(
                    context,
                  ).add(SelectForecast(forecastIndex: _index)),
                }
            },
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerLow,
                borderRadius: BorderRadius.vertical(
                  top: const Radius.circular(12),
                  bottom: Radius.circular(isSelected ? 0 : 12)
                )
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 12.0,
                ),
                child: Row(
                  children: [
                    Column(
                      spacing: 10,
                      children: [
                        Text(
                          DateFormat(
                            DateFormat.ABBR_MONTH_WEEKDAY_DAY,
                          ).format(DateTime.parse(_hourly.time![_index])),
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          getWeatherIcon(_hourly.weather_code![_index]),
                          color: Theme.of(context).colorScheme.primary,
                          size: 50,
                        ),
                        Text(
                          "${_hourly.temperature_2m![_index]}${_hourlyUnits.temperature_2m}",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
