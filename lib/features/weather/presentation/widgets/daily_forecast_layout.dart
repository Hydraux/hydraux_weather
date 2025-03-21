import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydraux_weather/features/weather/domain/value_objects/daily_forecast_value_object.dart';
import 'package:hydraux_weather/features/weather/domain/value_objects/forecast_units_value_object.dart';
import 'package:hydraux_weather/features/weather/presentation/bloc/forecast/layout/forecast_layout_bloc.dart';
import 'package:hydraux_weather/features/weather/presentation/bloc/forecast/layout/forecast_layout_state.dart';
import 'package:hydraux_weather/features/weather/presentation/widgets/daily_forecast_card.dart';

class DailyForecastLayout extends StatelessWidget {
  final DailyForecastValueObject _daily;
  final ForecastUnitsValueObject _dailyUnits;

  const DailyForecastLayout({
    super.key,
    required BoxConstraints constraints,
    required DailyForecastValueObject daily,
    required ForecastUnitsValueObject dailyUnits,
  }) : _dailyUnits = dailyUnits,
       _daily = daily;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("14 Day Forecast", style: TextStyle(fontSize: 16),),
            SingleChildScrollView(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List<Widget>.generate(_daily.time!.length, (index) {
                  if (index == 0) return Container();
                  return BlocBuilder<ForecastLayoutBloc, ForecastLayoutState>(
                    builder: (context, state) {
                      return DailyForecastCard(
                        daily: _daily,
                        dailyUnits: _dailyUnits,
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
