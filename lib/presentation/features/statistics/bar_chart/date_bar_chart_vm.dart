import 'package:behivecompanion/presentation/features/statistics/bar_chart/bar_chart_bloc.dart';
import 'package:behivecompanion/presentation/features/statistics/bar_chart/period_generator.dart';
import 'package:built_value/built_value.dart';
import 'package:charts_flutter/flutter.dart';

part 'date_bar_chart_vm.g.dart';

abstract class DateBarChartVm implements Built<DateBarChartVm, DateBarChartVmBuilder> {
  DateBarChartVm._();

  factory DateBarChartVm([updates(DateBarChartVmBuilder b)]) = _$DateBarChartVm;

  String get hiveId;

  ViewState get period;

  List<ChartPeriod> get periodList;

  List<Series<BarDataEntry, String>> get seriesData;

  List<String> get dateList;

  List<String> get periodListText;

  List<MapEntry<ViewState, String>> get periodTypeItems;

  Map<ViewState, String> get menuOptions;

  Map<ViewState, String> get currentPeriodType;

  int get currentPeriodPos;

  bool get isLoading;

  factory DateBarChartVm.init(String hiveId) {
    return DateBarChartVm((b) => b
      ..period = ViewState.Week
      ..hiveId = hiveId
      ..dateList = []
      ..seriesData = []
      ..periodList = []
      ..periodTypeItems = {
        ViewState.Week: "Dia",
        ViewState.Month: "Semana",
      }.entries.toList()
      ..periodListText = []
      ..currentPeriodPos = 0
      ..menuOptions = {
        ViewState.Week: "Dia",
        ViewState.Month: "Semana",
      }
      ..currentPeriodType = {ViewState.Week: "Semana"}
      ..isLoading = false);
  }
}
