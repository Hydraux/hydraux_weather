import 'package:flutter/material.dart';
import 'package:hydraux_weather/features/weather/domain/value_objects/daily_forecast_value_object.dart';
import 'package:hydraux_weather/features/weather/domain/value_objects/forecast_units_value_object.dart';
import 'package:hydraux_weather/features/weather/presentation/utils/forecast_utils.dart';
import 'package:intl/intl.dart';

class DailyForecastLayout extends StatelessWidget {
  final DailyForecastValueObject _daily;
  final ForecastUnitsValueObject _dailyUnits;

  const DailyForecastLayout({
    super.key,
    required DailyForecastValueObject daily,
    required ForecastUnitsValueObject dailyUnits,
  }) : _dailyUnits = dailyUnits, _daily = daily;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: 
          List<Widget>.generate(_daily.time!.length, (index) {
            if(index == 0) return Container();
            return Card(
              child: Padding(
                padding: EdgeInsets.only(left: 24.0, right: 24.0, top: 12, bottom: 12),
                child: Column(
                  spacing: 10,
                  children: [
                    Text(
                      DateFormat.E()
                          .format(DateTime.parse(_daily.time![index]))
                          .toString(),
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      getWeatherIcon(precipitationSum: _daily.precipitation_sum![index], minTemperature: _daily.temperature_2m_min![index], cloudCover: 0, isFahrenheit: _dailyUnits.temperature_2m_min == "°F"), //TODO: Add cloud cover
                      color: Theme.of(context).colorScheme.primary,
                      size: 50,
                    ),
                    Column(
                      children: [
                        Text(
                          "${_daily.temperature_2m_max![index]}${_dailyUnits.temperature_2m_max}",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "${_daily.temperature_2m_min![index]}${_dailyUnits.temperature_2m_max}",
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
              ),
            );
          }),
      ),
    );
  }


}
