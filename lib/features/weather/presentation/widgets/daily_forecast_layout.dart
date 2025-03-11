import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydraux_weather/features/weather/domain/value_objects/daily_forecast_value_object.dart';
import 'package:hydraux_weather/features/weather/domain/value_objects/forecast_units_value_object.dart';
import 'package:hydraux_weather/features/weather/presentation/bloc/forecast/layout/forecast_layout_bloc.dart';
import 'package:hydraux_weather/features/weather/presentation/bloc/forecast/layout/forecast_layout_state.dart';
import 'package:hydraux_weather/features/weather/presentation/widgets/daily_forecast_card.dart';
import 'package:hydraux_weather/features/weather/presentation/widgets/daily_forecast_card_expanded.dart';

class DailyForecastLayout extends StatelessWidget {
  final BoxConstraints _constraints;
  final DailyForecastValueObject _daily;
  final ForecastUnitsValueObject _dailyUnits;

  const DailyForecastLayout({
    super.key,
    required BoxConstraints constraints,
    required DailyForecastValueObject daily,
    required ForecastUnitsValueObject dailyUnits,
  }) : _constraints = constraints,
       _dailyUnits = dailyUnits,
       _daily = daily;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.zero,
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List<Widget>.generate(_daily.time!.length, (index) {
          if (index == 0) return Container();
          return BlocBuilder<ForecastLayoutBloc, ForecastLayoutState>(
            builder: (context, state) {
              final isSelected = state.selectedIndex == index;

              return Padding(
                padding: EdgeInsets.only(top: 4, left: 4, right: 4),
                child: DailyForecastCard(
                  daily: _daily,
                  dailyUnits: _dailyUnits,
                  index: index,
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
