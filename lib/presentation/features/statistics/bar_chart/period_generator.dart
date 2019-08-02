import 'package:behivecompanion/presentation/features/statistics/bar_chart/bar_chart_bloc.dart';
import 'package:intl/intl.dart';

abstract class ChartPeriod {
  DateTime from;
  DateTime to;

  ChartPeriod(this.from, this.to);
}

class MonthPeriod extends ChartPeriod {
  MonthPeriod(DateTime from, DateTime to) : super(from, to);
}

class WeekPeriod extends ChartPeriod {
  WeekPeriod(DateTime from, DateTime to) : super(from, to);
}

class PeriodGenerator {
  List<WeekPeriod> createWeekList() {
    return List.generate(5, (index) => index).map((it) {
      final now = DateTime.now();

      DateTime date = DateTime.utc(
        now.year,
        now.month,
        now.day,
      ).subtract(Duration(days: 7 * it));

      final today = date.weekday;
      var monday = date.subtract(Duration(days: today - 1));
      var sunday = monday.add(Duration(days: 6));
      return WeekPeriod(monday, sunday);
    }).toList();
  }


  List<String> buildFor(ViewState periodType) {
    List<ChartPeriod> _periodList = [];
    if (periodType == ViewState.Month) {
      _periodList = createMonthList();
    } else {
      _periodList = createWeekList();
    }
    return _periodList.map((e) => getPeriodListFormat(e)).toList();
  }


  List<ChartPeriod> buildPeriodList(ViewState periodType) {
    if (periodType == ViewState.Month) {
      return createMonthList();
    } else {
      return createWeekList();
    }
  }

  String getPeriodListFormat(ChartPeriod period) {
    var formatter;
    if (period is MonthPeriod) {
      formatter = DateFormat('MMMM\nyyyy');
    } else {
      final formatter = DateFormat('dd');
      return "${formatter.format(period.from)} - ${formatter.format(period.to)}";
    }

    return formatter.format(period.from);
  }

  String getBarEntryFormat(ChartPeriod period) {
    if (period is MonthPeriod) {
      final formatter = DateFormat('dd');
      return "${formatter.format(period.from)} - ${formatter.format(period.to)}";
    } else {
      return DateFormat('E').format(period.from);
    }
  }

  List<MonthPeriod> createMonthList({int length=5}) {
    return List.generate(length, (index) => index + 1).map((it) {
      final now = DateTime.now();
      DateTime date = DateTime.utc(now.year, now.month - it);
      var nextMonth = DateTime.utc(date.year, date.month + 1);
      return MonthPeriod(date, nextMonth.subtract(Duration(days: 1)));
    }).toList();
  }

  ChartPeriod createDatePeriod(ViewState period, DateTime date) {
    if (period == ViewState.Week) {
      return WeekPeriod(date, date.add(Duration(days: 1)));
    } else {
      return MonthPeriod(date, date.add(Duration(days: 7)));
    }
  }
}
