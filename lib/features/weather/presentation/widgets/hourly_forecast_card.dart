import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydraux_weather/features/weather/domain/value_objects/forecast_units_value_object.dart';
import 'package:hydraux_weather/features/weather/domain/value_objects/hourly_forecast_value_object.dart';
import 'package:hydraux_weather/features/weather/presentation/bloc/forecast/layout/forecast_layout_bloc.dart';
import 'package:hydraux_weather/features/weather/presentation/bloc/forecast/layout/forecast_layout_event.dart';
import 'package:hydraux_weather/features/weather/presentation/bloc/forecast/layout/forecast_layout_state.dart';
import 'package:hydraux_weather/features/weather/presentation/utils/forecast_utils.dart';
import 'package:intl/intl.dart';

class HourlyForecastCard extends StatelessWidget {
  const HourlyForecastCard({
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

        return GestureDetector(
          onTap:
              () => {
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
                  },
              },
          child: Card(
            color: Theme.of(context).colorScheme.surfaceContainerHigh,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 12.0,
              ),
              child: Column(
                children: [
                  Column(
                    spacing: 10,
                    children: [
                      Row(
                        spacing: 10,
                        children: [
                          _getDayLabel(_hourly, context, _index),
                      Text(
                        DateFormat(
                          DateFormat.HOUR,
                        ).format(DateTime.parse(_hourly.time![_index])),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                        ],
                      ),
                      Icon(
                        getWeatherIcon(_hourly.weather_code![_index]),
                        color: Theme.of(context).colorScheme.primary,
                        size: 50,
                      ),
                      Row(
                        spacing: isSelected ? 20 : 0,
                        children: [
                          Column(
                            children: [
                              Text(
                                "${_hourly.temperature_2m![_index]}${_hourlyUnits.temperature_2m}",
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "Humidity: ${_hourly.relative_humidity_2m![_index]}${_hourlyUnits.relative_humidity_2m}",
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          isSelected
                              ? _forecastDetails(context)
                              : SizedBox.shrink(),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _forecastDetails(BuildContext context) {
    return (Column(
      children: [
        Text(
          "Precip chance: ${_hourly.precipitation_probability![_index]}${_hourlyUnits.precipitation_probability}",
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "Precip amount: ${_hourly.precipitation![_index]}${_hourlyUnits.precipitation == "inch" ? "in" : _hourlyUnits.precipitation}",
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ));
  }
}

Widget _getDayLabel(
  HourlyForecastValueObject hourly,
  BuildContext context,
  int index,
) {
  if (DateTime.parse(hourly.time![index]).day > DateTime.now().day) {
    return Text(
      DateFormat(
        DateFormat.ABBR_MONTH_DAY,
      ).format(DateTime.parse(hourly.time![index])),
      style: TextStyle(
        color: Theme.of(context).colorScheme.primary,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  return Container();
}
