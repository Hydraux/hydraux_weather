import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydraux_weather/features/weather/presentation/bloc/forecast/remote/remote_forecast_bloc.dart';
import 'package:hydraux_weather/features/weather/presentation/bloc/forecast/remote/remote_forecast_event.dart';
import 'package:hydraux_weather/features/weather/presentation/pages/home/forecast.dart';
import 'package:hydraux_weather/injection_container.dart';

void main() async {
  await initializeDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteForecastBloc>(
      create: (context) => sl()..add(const GetForecasts()),
      child: MaterialApp(
        theme: ThemeData.light(useMaterial3: true),
        darkTheme: ThemeData.dark(useMaterial3: true),
        home: Forecast()
      ),
    );
  }
}
