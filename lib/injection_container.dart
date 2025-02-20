import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hydraux_weather/features/weather/data/data_sources/remote/forecast_api_service.dart';
import 'package:hydraux_weather/features/weather/data/repository/forecast_repository_impl.dart';
import 'package:hydraux_weather/features/weather/domain/repositories/forecast_repository.dart';
import 'package:hydraux_weather/features/weather/domain/usecases/get_forecast.dart';
import 'package:hydraux_weather/features/weather/presentation/bloc/forecast/remote/remote_forecast_bloc.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  final Dio dio = Dio();
  dio.interceptors.add(PrettyDioLogger());

  // Dio
  sl.registerSingleton<Dio>(dio);
  // Dependencies
  sl.registerSingleton<ForecastApiService>(ForecastApiService(sl()));
  sl.registerSingleton<ForecastRepository>(ForecastRepositoryImpl(sl()));

  // UseCases
  sl.registerSingleton<GetForecastUseCase>(GetForecastUseCase(sl()));

  // Blocs
  sl.registerFactory<RemoteForecastBloc>(()=>RemoteForecastBloc(sl()));
}