import 'package:behivecompanion/data/repositories/auth/auth_repository.dart';
import 'package:behivecompanion/data/repositories/auth/auth_repository_impl.dart';
import 'package:behivecompanion/data/repositories/auth/mock_auth_repository.dart';
import 'package:behivecompanion/data/repositories/hives/hive_repository.dart';
import 'package:behivecompanion/data/repositories/hives/hive_repositoryimpl.dart';
import 'package:behivecompanion/data/repositories/hives/mock_hive_repository.dart';
import 'package:provider/provider.dart';


List<SingleChildCloneableWidget> actualServices = [
  Provider<AuthRepository>.value(value: AuthRepositoryImpl()),
  Provider.value(value: HiveRepositoryImpl()),
];

List<SingleChildCloneableWidget> mockedServices = [
  Provider<AuthRepository>.value(value: AuthRepositoryMock()),
  Provider<HiveRepository>.value(value: HiveRepositoryMock()),
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