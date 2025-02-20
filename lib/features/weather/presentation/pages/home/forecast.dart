import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydraux_weather/features/weather/presentation/bloc/forecast/remote/remote_forecast_bloc.dart';
import 'package:hydraux_weather/features/weather/presentation/bloc/forecast/remote/remote_forecast_event.dart';
import 'package:hydraux_weather/features/weather/presentation/bloc/forecast/remote/remote_forecast_state.dart';
import 'package:hydraux_weather/features/weather/presentation/widgets/current_forecast_layout.dart';
import 'package:hydraux_weather/features/weather/presentation/widgets/daily_forecast_layout.dart';
import 'package:hydraux_weather/injection_container.dart';

class Forecast extends StatelessWidget {
  const Forecast({super.key});

  @override
  Widget build(BuildContext context) {
    Timer.periodic(Duration(hours: 1), (Timer t) => BlocProvider.of<RemoteForecastBloc>(context).add(GetForecasts()));
    return Scaffold(
        body: Padding(padding: EdgeInsets.zero, child: _buildBody()),
      );
  }

  _buildBody() {
    return BlocListener<RemoteForecastBloc, RemoteForecastState>(
      listener: (context, state) {
        print("Listener called");
        if (state is RemoteForecastsError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Unknown error occurred"), duration: Duration(days: 1), action: SnackBarAction(label: "Retry", onPressed: (){
          ScaffoldMessenger.of(context).clearSnackBars();
          BlocProvider.of<RemoteForecastBloc>(context).add(GetForecasts());
          }),));
        }

        if (state is PermissionsError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to get location due to a permissions error"), duration: Duration(days: 1) , action: SnackBarAction(label: "Retry", onPressed: (){
          ScaffoldMessenger.of(context).clearSnackBars();
          BlocProvider.of<RemoteForecastBloc>(context).add(GetForecasts());
          }),));

        }
      },
      child: BlocBuilder<RemoteForecastBloc, RemoteForecastState>(
        builder: (context, state) {
          if (state is RemoteForecastsLoading) {
            return const Center(child: CircularProgressIndicator());
          }
      
          if (state is RemoteForecastsError || state is PermissionsError) {
            return const Center(child: Icon(Icons.error_outline));
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
                        lastUpdated: state.forecast!.lastUpdated!,
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
      ),
    );
  }
}
