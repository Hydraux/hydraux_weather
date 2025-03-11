import 'package:equatable/equatable.dart';

abstract class ForecastLayoutState extends Equatable{
  final int? selectedIndex;

  const ForecastLayoutState({this.selectedIndex});

  @override
  List<Object?> get props => [selectedIndex];
}

class DailyForecastSelected extends ForecastLayoutState{
  const DailyForecastSelected(int index): super(selectedIndex: index);
}

class NoForecastSelected extends ForecastLayoutState {
  const NoForecastSelected();
}