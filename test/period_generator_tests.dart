import 'package:behivecompanion/presentation/features/statistics/bar_chart/period_generator.dart';
import 'package:test/test.dart';

void main() {
  PeriodGenerator sut = PeriodGenerator();

  test("Weekperiod are all mondays and sundays", () {
    final weekList = sut.createWeekList();
    final resultFrom = weekList.where((e) => e.from.weekday != 1);
    final resultTo = weekList.where((e) => e.to.weekday != 7);
    expect(resultFrom, isEmpty);
    expect(resultTo, isEmpty);
  });

  test("WeekPeriods are exactly one week apart", () {
    final weekList = sut.createWeekList();

    for (var i = 0; i <= 3; i++) {
      final diff = weekList[i].from.difference(weekList[i + 1].from);
      expect(diff.inDays, 7);
    }
  });

  test("There are exacly 5 periods", () {
    final weekList = sut.createWeekList();
    expect(weekList.length, 5);
  });

  test("MonthsPeriods are exactly one month apart", () {
    final monthList = sut.createMonthList();
    for (var i = 0; i <= 3; i++) {
      final diff = monthList[i].from.month - (monthList[i + 1].from.month);
      expect(diff, 1);
    }
  });

  test("""MonthsPeriods "from" and "to" are always in the same month""", () {
    final monthList = sut.createMonthList();
    for (var i = 0; i <= 3; i++) {
      final diff = monthList[i].from.month - (monthList[i].to.month);
      expect(diff, 0);
    }
  });
}
