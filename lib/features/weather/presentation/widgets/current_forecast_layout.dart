import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydraux_weather/features/weather/domain/value_objects/current_forecast_value_object.dart';
import 'package:hydraux_weather/features/weather/domain/value_objects/daily_forecast_value_object.dart';
import 'package:hydraux_weather/features/weather/domain/value_objects/forecast_units_value_object.dart';
import 'package:hydraux_weather/features/weather/presentation/bloc/forecast/remote/remote_forecast_bloc.dart';
import 'package:hydraux_weather/features/weather/presentation/bloc/forecast/remote/remote_forecast_event.dart';
import 'package:hydraux_weather/features/weather/presentation/utils/forecast_utils.dart';
import 'package:hydraux_weather/features/weather/presentation/widgets/current_forecast_data_card.dart';

class CurrentForecastLayout extends StatelessWidget {
  final BoxConstraints constraints;
  final CurrentForecastValueObject current;
  final ForecastUnitsValueObject current_units;
  final DailyForecastValueObject daily;
  final bool isFahrenheit;
  final DateTime lastUpdated;

  const CurrentForecastLayout({
    super.key,
    required this.constraints,
    required this.current,
    required this.current_units,
    required this.daily,
    required this.isFahrenheit,
    required this.lastUpdated,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      child: Center(
        child: SizedBox(
          width: constraints.maxWidth,
          child: Card(
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Tooltip(message: "Last Updated: ${lastUpdated.toLocal()}",child: Icon(Icons.info_outline, color: Theme.of(context).colorScheme.secondary,),),
                        Spacer(),
                        IconButton(onPressed: (){BlocProvider.of<RemoteForecastBloc>(context).add(GetForecasts());}, icon: Icon(Icons.refresh, color: Theme.of(context).colorScheme.secondary,))
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Icon(
                            getWeatherIcon(
                              current.weather_code!
                            ),
                            size: 80,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        Text(
                          '${current.temperature_2m!}${current_units.temperature_2m}',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            CurrentForecastDataCard(
                              icon: Icons.air,
                              value:
                                  "${current.wind_speed_10m} ${current_units.wind_speed_10m}",
                              label: "Wind Speed",
                            ),
                            CurrentForecastDataCard(
                              icon: Icons.water_drop,
                              value:
                                  "${current.precipitation} ${current_units.precipitation}",
                              label: "Precipitation",
                            ),
                            CurrentForecastDataCard(
                              icon: Icons.water,
                              value:
                                  "${current.relative_humidity_2m} ${current_units.relative_humidity_2m}",
                              label: "Humidity",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
