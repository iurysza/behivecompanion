// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date_bar_chart_vm.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DateBarChartVm extends DateBarChartVm {
  @override
  final String hiveId;
  @override
  final ViewState period;
  @override
  final List<ChartPeriod> periodList;
  @override
  final List<Series<BarDataEntry, String>> seriesData;
  @override
  final List<String> dateList;
  @override
  final List<String> periodListText;
  @override
  final List<MapEntry<ViewState, String>> periodTypeItems;
  @override
  final Map<ViewState, String> menuOptions;
  @override
  final Map<ViewState, String> currentPeriodType;
  @override
  final int currentPeriodPos;
  @override
  final bool isLoading;

  factory _$DateBarChartVm([void Function(DateBarChartVmBuilder) updates]) =>
      (new DateBarChartVmBuilder()..update(updates)).build();

  _$DateBarChartVm._(
      {this.hiveId,
      this.period,
      this.periodList,
      this.seriesData,
      this.dateList,
      this.periodListText,
      this.periodTypeItems,
      this.menuOptions,
      this.currentPeriodType,
      this.currentPeriodPos,
      this.isLoading})
      : super._() {
    if (hiveId == null) {
      throw new BuiltValueNullFieldError('DateBarChartVm', 'hiveId');
    }
    if (period == null) {
      throw new BuiltValueNullFieldError('DateBarChartVm', 'period');
    }
    if (periodList == null) {
      throw new BuiltValueNullFieldError('DateBarChartVm', 'periodList');
    }
    if (seriesData == null) {
      throw new BuiltValueNullFieldError('DateBarChartVm', 'seriesData');
    }
    if (dateList == null) {
      throw new BuiltValueNullFieldError('DateBarChartVm', 'dateList');
    }
    if (periodListText == null) {
      throw new BuiltValueNullFieldError('DateBarChartVm', 'periodListText');
    }
    if (periodTypeItems == null) {
      throw new BuiltValueNullFieldError('DateBarChartVm', 'periodTypeItems');
    }
    if (menuOptions == null) {
      throw new BuiltValueNullFieldError('DateBarChartVm', 'menuOptions');
    }
    if (currentPeriodType == null) {
      throw new BuiltValueNullFieldError('DateBarChartVm', 'currentPeriodType');
    }
    if (currentPeriodPos == null) {
      throw new BuiltValueNullFieldError('DateBarChartVm', 'currentPeriodPos');
    }
    if (isLoading == null) {
      throw new BuiltValueNullFieldError('DateBarChartVm', 'isLoading');
    }
  }

  @override
  DateBarChartVm rebuild(void Function(DateBarChartVmBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DateBarChartVmBuilder toBuilder() =>
      new DateBarChartVmBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DateBarChartVm &&
        hiveId == other.hiveId &&
        period == other.period &&
        periodList == other.periodList &&
        seriesData == other.seriesData &&
        dateList == other.dateList &&
        periodListText == other.periodListText &&
        periodTypeItems == other.periodTypeItems &&
        menuOptions == other.menuOptions &&
        currentPeriodType == other.currentPeriodType &&
        currentPeriodPos == other.currentPeriodPos &&
        isLoading == other.isLoading;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc($jc(0, hiveId.hashCode),
                                            period.hashCode),
                                        periodList.hashCode),
                                    seriesData.hashCode),
                                dateList.hashCode),
                            periodListText.hashCode),
                        periodTypeItems.hashCode),
                    menuOptions.hashCode),
                currentPeriodType.hashCode),
            currentPeriodPos.hashCode),
        isLoading.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DateBarChartVm')
          ..add('hiveId', hiveId)
          ..add('period', period)
          ..add('periodList', periodList)
          ..add('seriesData', seriesData)
          ..add('dateList', dateList)
          ..add('periodListText', periodListText)
          ..add('periodTypeItems', periodTypeItems)
          ..add('menuOptions', menuOptions)
          ..add('currentPeriodType', currentPeriodType)
          ..add('currentPeriodPos', currentPeriodPos)
          ..add('isLoading', isLoading))
        .toString();
  }
}

class DateBarChartVmBuilder
    implements Builder<DateBarChartVm, DateBarChartVmBuilder> {
  _$DateBarChartVm _$v;

  String _hiveId;
  String get hiveId => _$this._hiveId;
  set hiveId(String hiveId) => _$this._hiveId = hiveId;

  ViewState _period;
  ViewState get period => _$this._period;
  set period(ViewState period) => _$this._period = period;

  List<ChartPeriod> _periodList;
  List<ChartPeriod> get periodList => _$this._periodList;
  set periodList(List<ChartPeriod> periodList) =>
      _$this._periodList = periodList;

  List<Series<BarDataEntry, String>> _seriesData;
  List<Series<BarDataEntry, String>> get seriesData => _$this._seriesData;
  set seriesData(List<Series<BarDataEntry, String>> seriesData) =>
      _$this._seriesData = seriesData;

  List<String> _dateList;
  List<String> get dateList => _$this._dateList;
  set dateList(List<String> dateList) => _$this._dateList = dateList;

  List<String> _periodListText;
  List<String> get periodListText => _$this._periodListText;
  set periodListText(List<String> periodListText) =>
      _$this._periodListText = periodListText;

  List<MapEntry<ViewState, String>> _periodTypeItems;
  List<MapEntry<ViewState, String>> get periodTypeItems =>
      _$this._periodTypeItems;
  set periodTypeItems(List<MapEntry<ViewState, String>> periodTypeItems) =>
      _$this._periodTypeItems = periodTypeItems;

  Map<ViewState, String> _menuOptions;
  Map<ViewState, String> get menuOptions => _$this._menuOptions;
  set menuOptions(Map<ViewState, String> menuOptions) =>
      _$this._menuOptions = menuOptions;

  Map<ViewState, String> _currentPeriodType;
  Map<ViewState, String> get currentPeriodType => _$this._currentPeriodType;
  set currentPeriodType(Map<ViewState, String> currentPeriodType) =>
      _$this._currentPeriodType = currentPeriodType;

  int _currentPeriodPos;
  int get currentPeriodPos => _$this._currentPeriodPos;
  set currentPeriodPos(int currentPeriodPos) =>
      _$this._currentPeriodPos = currentPeriodPos;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  DateBarChartVmBuilder();

  DateBarChartVmBuilder get _$this {
    if (_$v != null) {
      _hiveId = _$v.hiveId;
      _period = _$v.period;
      _periodList = _$v.periodList;
      _seriesData = _$v.seriesData;
      _dateList = _$v.dateList;
      _periodListText = _$v.periodListText;
      _periodTypeItems = _$v.periodTypeItems;
      _menuOptions = _$v.menuOptions;
      _currentPeriodType = _$v.currentPeriodType;
      _currentPeriodPos = _$v.currentPeriodPos;
      _isLoading = _$v.isLoading;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DateBarChartVm other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$DateBarChartVm;
  }

  @override
  void update(void Function(DateBarChartVmBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DateBarChartVm build() {
    final _$result = _$v ??
        new _$DateBarChartVm._(
            hiveId: hiveId,
            period: period,
            periodList: periodList,
            seriesData: seriesData,
            dateList: dateList,
            periodListText: periodListText,
            periodTypeItems: periodTypeItems,
            menuOptions: menuOptions,
            currentPeriodType: currentPeriodType,
            currentPeriodPos: currentPeriodPos,
            isLoading: isLoading);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
