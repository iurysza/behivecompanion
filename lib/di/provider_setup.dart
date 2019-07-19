import 'package:behivecompanion/data/repositories/auth/auth_repository_impl.dart';
import 'package:behivecompanion/data/repositories/hives/hive_repositoryimpl.dart';
import 'package:provider/provider.dart';

//List<SingleChildCloneableWidget> independentServices = [
//  Provider.value(value: AuthRepositoryImpl())
//];

List<SingleChildCloneableWidget> providers = [
  Provider.value(value: AuthRepositoryImpl()),
  Provider.value(value: HiveRepositoryImpl()),
];

//
//List<SingleChildCloneableWidget> dependentServices = [
//  ProxyProvider<Api, AuthenticationService>(
//    builder: (context, api, authenticationService) =>
//        AuthenticationService(api: api),
//  )
//];

//List<SingleChildCloneableWidget> uiConsumableProviders = [
//  StreamProvider<User>(
//    builder: (context) => Provider.of<AuthenticationService>(context, listen: false).user,
//  )
//];
