import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hydraux_weather/features/weather/presentation/bloc/forecast/remote/remote_forecast_state.dart';
import 'package:intl/intl.dart';

class ForecastChartView extends StatelessWidget {
  final RemoteForecastState state;
  const ForecastChartView({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ForecastChart(
              time: state.forecast!.hourly!.time!,
              title: "Hourly Temperature",
              series1: state.forecast!.hourly!.temperature_2m!,
              series1Color: Theme.of(context).colorScheme.primary,
              dateFormat: DateFormat.j(),
              xInterval: Duration.millisecondsPerHour * 2,
              yInterval: 20,
              yMax: 120,
              yMin: -20,
              ),
              ForecastChart(
              time: state.forecast!.hourly!.time!,
              title: "Hourly Precipitation",
              series1: state.forecast!.hourly!.precipitation!,
              series1Color: Theme.of(context).colorScheme.primary,
              dateFormat: DateFormat.j(),
              xInterval: Duration.millisecondsPerHour * 2,
              yInterval: 2,
              yMax: 12,
              yMin: 0,
              ),
              ForecastChart(
              time: state.forecast!.daily!.time!, 
              title: "Daily Temperature",
              series1: state.forecast!.daily!.temperature_2m_max!,
              series2: state.forecast!.daily!.temperature_2m_min,
              series1Color: Theme.of(context).colorScheme.error,
              series2Color: Theme.of(context).colorScheme.primary,
              dateFormat: DateFormat(DateFormat.ABBR_MONTH_DAY),
              xInterval: Duration.millisecondsPerDay * 2,
              yInterval: 20,
              yMax: 120,
              yMin: -20,
              ),
              ForecastChart(
              time: state.forecast!.daily!.time!,
              title: "Daily Precipitation",
              series1: state.forecast!.daily!.precipitation_sum!,
              series1Color: Theme.of(context).colorScheme.primary,
              dateFormat: DateFormat(DateFormat.ABBR_MONTH_DAY),
              xInterval: Duration.millisecondsPerDay * 2,
              yInterval: 2,
              yMax: 12,
              yMin: 0,
              ),
          ],
        ),
      ),
    );
  }
}

class ForecastChart extends StatelessWidget {
  const ForecastChart({
    super.key,
    required this.time,
    required this.title,
    required this.series1,
    this.series2,
    required this.series1Color,
    this.series2Color,
    required this.dateFormat,
    required this.xInterval,
    required this.yInterval,
    required this.yMax,
    required this.yMin,
  });

  final List<dynamic> time;
  final String title;
  final List<dynamic> series1;
  final List<dynamic>? series2;
  final Color series1Color;
  final Color? series2Color;
  final DateFormat dateFormat;
  final double xInterval;
  final double yInterval;
  final double yMax;
  final double yMin;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, style: TextStyle(fontSize: 24)),
            AspectRatio(
              aspectRatio: 500 / 300,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                  child: SizedBox(
                    width: time.length * 50,
                    child: LineChart(
                      LineChartData(
                        borderData: FlBorderData(show: false),
                        gridData: FlGridData(
                          verticalInterval: xInterval,
                          horizontalInterval: yInterval,
                        ),
                        titlesData: FlTitlesData(
                          topTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget:
                                  (value, meta) =>
                                      Text(value.toInt().toString()),
                              interval: yInterval,
                              maxIncluded: false,
                              minIncluded: false,
                              reservedSize: 32,
                            ),
                          ),
                          rightTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget:
                                  (value, meta) =>
                                      Text(value.toInt().toString()),
                              interval: yInterval,
                              maxIncluded: false,
                              minIncluded: false,
                              reservedSize: 32,
                            ),
                          ),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              interval: xInterval,
                              showTitles: true,
                              maxIncluded: false,
                              minIncluded: false,
                              getTitlesWidget: (value, meta) {
                                final date =
                                    DateTime.fromMillisecondsSinceEpoch(
                                      value.toInt(),
                                      isUtc: false,
                                    );
          
                                final title = dateFormat.format(date);
          
                                return Text(
                                  title,
                                  textAlign: TextAlign.right,
                                );
                              },
                            ),
                          ),
                        ),
                        minY: yMin,
                        maxY: yMax,
                        lineBarsData: [
                          LineChartBarData(
                            dotData: FlDotData(show: false),
                            isCurved: true,
                            color: series1Color,
                            spots: List.generate(
                              time.length,
                              (index) => FlSpot(
                                DateTime.parse(
                                  time[index],
                                ).millisecondsSinceEpoch.toDouble(),
                                series1[index],
                              ),
                            ),
                          ),
                        if(series2 != null)
                        LineChartBarData(
                            dotData: FlDotData(show: false),
                            isCurved: true,
                            color: series2Color,
                            spots: List.generate(
                              time.length,
                              (index) => FlSpot(
                                DateTime.parse(
                                  time[index],
                                ).millisecondsSinceEpoch.toDouble(),
                                series2![index],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
