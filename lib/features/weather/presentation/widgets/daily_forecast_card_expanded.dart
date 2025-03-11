
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydraux_weather/features/weather/domain/value_objects/daily_forecast_value_object.dart';
import 'package:hydraux_weather/features/weather/domain/value_objects/forecast_units_value_object.dart';
import 'package:hydraux_weather/features/weather/presentation/bloc/forecast/layout/forecast_layout_bloc.dart';
import 'package:hydraux_weather/features/weather/presentation/bloc/forecast/layout/forecast_layout_event.dart';
import 'package:hydraux_weather/features/weather/presentation/bloc/forecast/layout/forecast_layout_state.dart';
import 'package:hydraux_weather/features/weather/presentation/utils/forecast_utils.dart';
import 'package:intl/intl.dart';

class DailyForecastCardExpanded extends StatelessWidget {
  const DailyForecastCardExpanded({
    super.key,
    required DailyForecastValueObject daily,
    required ForecastUnitsValueObject dailyUnits,
    required int index,
  }) : _daily = daily,
       _dailyUnits = dailyUnits,
       _index = index;

  final DailyForecastValueObject _daily;
  final ForecastUnitsValueObject _dailyUnits;
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
                          ).format(DateTime.parse(_daily.time![_index])),
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          getWeatherIcon(_daily.weather_code![_index]),
                          color: Theme.of(context).colorScheme.primary,
                          size: 50,
                        ),
                        Column(
                          children: [
                            Text(
                              "${_daily.temperature_2m_max![_index]}${_dailyUnits.temperature_2m_max}",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "${_daily.temperature_2m_min![_index]}${_dailyUnits.temperature_2m_max}",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text("test")
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
