import 'package:behivecompanion/data/repositories/AuthRepository.dart';
import 'package:behivecompanion/data/repositories/utils/api_response.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockUserRepo extends Mock implements AuthRepository {}

void main() {
  test("Get SmsCode returns success", () async {
    //Given

    final mockUserRepo = MockUserRepo();

    var apiResponse = ApiResponse(["result"], null);
    when(mockUserRepo.requestSmsCode("", "")).thenAnswer((_) async => Future.value(apiResponse));
    var response = await mockUserRepo.requestSmsCode("", "");

    expect(null, response.error);
  });
}
