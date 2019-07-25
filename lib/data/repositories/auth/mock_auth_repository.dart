import 'package:behivecompanion/data/repositories/auth/auth_repository.dart';
import 'package:behivecompanion/data/repositories/utils/api_response.dart';
import 'package:rxdart/rxdart.dart';

class AuthRepositoryMock extends AuthRepository {
  @override
  Future<ApiResponse> requestSmsCode(String countryCode, String phoneNumber) {
    return Observable<ApiResponse>.timer(buildResponseWith([]),Duration(seconds: 3)).first;
  }

  @override
  Future<ApiResponse> loginWithPhone(String countryCode, String phoneNumber, String code) {
    return Observable<ApiResponse>.timer(buildResponseWith([]),Duration(seconds: 3)).first;
  }
}
