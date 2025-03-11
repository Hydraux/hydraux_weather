import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydraux_weather/features/weather/domain/value_objects/forecast_units_value_object.dart';
import 'package:hydraux_weather/features/weather/domain/value_objects/hourly_forecast_value_object.dart';
import 'package:hydraux_weather/features/weather/presentation/bloc/forecast/layout/forecast_layout_bloc.dart';
import 'package:hydraux_weather/features/weather/presentation/bloc/forecast/layout/forecast_layout_state.dart';
import 'package:hydraux_weather/features/weather/presentation/widgets/hourly_forecast_card.dart';

class HourlyForecastLayout extends StatelessWidget {
  final HourlyForecastValueObject _hourly;
  final ForecastUnitsValueObject _hourlyUnits;

  const HourlyForecastLayout({
    super.key,
    required BoxConstraints constraints,
    required HourlyForecastValueObject hourly,
    required ForecastUnitsValueObject hourlyUnits,
  }) : _hourlyUnits = hourlyUnits,
       _hourly = hourly;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hourly Forecast", style: TextStyle(fontSize: 16),),
            SingleChildScrollView(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List<Widget>.generate(_hourly.time!.length, (index) {
                  if (index == 0 || DateTime.parse(_hourly.time![index]).isBefore(DateTime.now())) return Container();
                  return BlocBuilder<ForecastLayoutBloc, ForecastLayoutState>(
                    builder: (context, state) {
                      return HourlyForecastCard(
                        hourly: _hourly,
                        hourlyUnits: _hourlyUnits,
                        index: index,
                      );
                    },
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
