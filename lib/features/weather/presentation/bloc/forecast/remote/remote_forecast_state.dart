import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:hydraux_weather/features/weather/domain/value_objects/forecast_value_object.dart';

abstract class RemoteForecastState extends Equatable{
  final ForecastValueObject? forecast;
  final DioException? exception;
  final bool pending;

  const RemoteForecastState({this.forecast, this.exception, this.pending = false});

  @override
  List<Object?> get props => [forecast, exception, pending];
}

class RemoteForecastsLoading extends RemoteForecastState{
  const RemoteForecastsLoading(): super(pending: true);
}

class RemoteForecastsDone extends RemoteForecastState{
  const RemoteForecastsDone(ForecastValueObject forecast): super(forecast: forecast);
}

class RemoteForecastsError extends RemoteForecastState{
  const RemoteForecastsError(DioException exception) : super(exception: exception);
}

class PermissionsError extends RemoteForecastState{
  const PermissionsError();
}