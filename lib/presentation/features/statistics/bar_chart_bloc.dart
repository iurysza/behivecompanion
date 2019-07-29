import 'package:behivecompanion/presentation/base/base_model.dart';
import 'package:behivecompanion/presentation/features/statistics/period_generator.dart';

class BarChartBloc extends BaseModel {
  List<String> dateList = [];
  ViewState period = ViewState.Month;

  List<ChartPeriod> _periodList=[];

  final PeriodGenerator periodGenerator;

  int selectedDate;

  BarChartBloc(this.periodGenerator) {
    if (period == ViewState.Month) {
      _periodList = periodGenerator.createMonthList();
    } else {
      _periodList = periodGenerator.createWeekList();
    }
  }

  void initDates() {
    dateList = _periodList.map((e) => periodGenerator.asString(e)).toList();
    notifyListeners();
  }

  onDateSelected(int pos) {
    this.selectedDate = pos;
    notifyListeners();
  }

}

enum ViewState {
  Month,
  Week,
}
