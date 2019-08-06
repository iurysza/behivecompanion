import 'package:behivecompanion/data/repositories/auth/auth_repository.dart';
import 'package:behivecompanion/data/repositories/auth/auth_repository_impl.dart';
import 'package:behivecompanion/data/repositories/auth/mock_auth_repository.dart';
import 'package:behivecompanion/data/repositories/hives/hive_repository.dart';
import 'package:behivecompanion/data/repositories/hives/hive_repositoryimpl.dart';
import 'package:behivecompanion/data/repositories/hives/mock_hive_repository.dart';
import 'package:behivecompanion/data/repositories/statistics/mock_statistics_repository.dart';
import 'package:behivecompanion/data/repositories/statistics/statistics_repository.dart';
import 'package:behivecompanion/data/repositories/statistics/statistics_repositoryimpl.dart';
import 'package:behivecompanion/presentation/features/statistics/bar_chart/period_generator.dart';
import 'package:provider/provider.dart';

List<SingleChildCloneableWidget> actualServices = [
  Provider<AuthRepository>.value(value: AuthRepositoryImpl()),
  Provider<StatisticsRepository>.value(value: StatisticsRepositoryImpl()),
  Provider<HiveRepository>.value(value: HiveRepositoryImpl()),
  Provider<PeriodGenerator>.value(value: PeriodGenerator()),
];

List<SingleChildCloneableWidget> mockedServices = [
  Provider<AuthRepository>.value(value: AuthRepositoryMock()),
  Provider<HiveRepository>.value(value: HiveRepositoryMock()),
  Provider<PeriodGenerator>.value(value: PeriodGenerator()),
  Provider<StatisticsRepository>.value(value: StatisticsRepositoryMock()),
];
//

List<SingleChildCloneableWidget> providers = [
  ...actualServices,
//  ...dependentServices,
];

//List<SingleChildCloneableWidget> uiConsumableProviders = [
//  StreamProvider<User>(
//    builder: (context) => Provider.of<AuthenticationService>(context, listen: false).user,
//  )
//];

//List<SingleChildCloneableWidget> dependentServices = [
//  ProxyProvider<AuthRepositoryImpl, LoginBloc>(
//    builder: (context, authRepository, authenticationService) => LoginBloc(authRepository),
//  ),
//  ProxyProvider<HiveRepositoryImpl, HiveListBloc>(
//    builder: (context, hiveRepository, authenticationService) => HiveListBloc(hiveRepository),
//  )
//];
