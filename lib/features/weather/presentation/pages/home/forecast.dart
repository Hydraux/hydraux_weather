import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydraux_weather/features/weather/presentation/bloc/forecast/remote/remote_forecast_bloc.dart';
import 'package:hydraux_weather/features/weather/presentation/bloc/forecast/remote/remote_forecast_state.dart';
import 'package:hydraux_weather/features/weather/presentation/widgets/current_forecast_layout.dart';
import 'package:hydraux_weather/features/weather/presentation/widgets/daily_forecast_layout.dart';

class Forecast extends StatelessWidget {
  const Forecast({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: EdgeInsets.zero, child: _buildBody()),
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteForecastBloc, RemoteForecastState>(
      builder: (_, state) {
        if (state is RemoteForecastsLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is RemoteForecastsError) {
          return const Center(child: Icon(Icons.refresh));
        }

        if (state is RemoteForecastsDone) {
          return LayoutBuilder(
            builder: (context, constraints) {
              return SizedBox(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CurrentForecastLayout(
                      constraints: constraints,
                      current: state.forecast!.current!,
                      current_units: state.forecast!.current_units!,
                      daily: state.forecast!.daily!,
                      isFahrenheit: state.forecast!.daily_units!.temperature_2m_min == "°F",
                    ),
                    DailyForecastLayout(daily: state.forecast!.daily!, dailyUnits: state.forecast!.daily_units!)
                  ],
                ),
              );
            },
          );
        }
        return const SizedBox();
      },
    );
  }
}
