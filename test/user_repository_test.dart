import 'package:behivecompanion/data/repositories/auth/auth_repository.dart';
import 'package:behivecompanion/data/repositories/utils/api_error.dart';
import 'package:behivecompanion/data/repositories/utils/api_response.dart';
import 'package:behivecompanion/presentation/features/login/login_bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockUserRepo extends Mock implements AuthRepository {}

void main() {
  AuthRepository mockUserRepo = MockUserRepo();
  LoginBloc sut = LoginBloc(mockUserRepo);

  setUp(() {
    mockUserRepo = MockUserRepo();
    sut = LoginBloc(mockUserRepo);
  });

  tearDown(() {
    clearInteractions(mockUserRepo);
  });

  group("ViewModel Updates", () {
    test("Country code is correctly updated", () {
      //Given
      final countryCode = "1";

      //When
      sut.onCountryCodeChanged("+1");

      //Then
      expect(countryCode, sut.vm.countryCode);
    });

    test("Sms code is correctly updated", () {
      //Given
      final smsCode = "2134";

      //When
      sut.onSmsCodeChanged(smsCode);

      //Then
      expect(smsCode, sut.vm.smsCode);
    });

    test("PhoneNumber is correctly updated", () {
      //Given
      final phoneNumber = "31993942106";

      //When
      sut.onPhoneChanged("(31) 993942106");

      //Then
      expect(phoneNumber, sut.vm.phoneNumber);
    });
  });


  group("ViewState is Correctly Updated", (){

    test("Invalid Phone number sets ViewState.Error", () async {
      //Given

      sut.onPhoneChanged("(31) 99394");
      //When
      sut.requestCode();

      //Then
      expect(sut.state, ViewState.Error);
      expect(sut.vm.errorMsg, "Número inválido");
    });

    test("When Api returns error the ViewModel is updated correctly", () async {
      //Given
      sut.onPhoneChanged("(31) 993942106");
      sut.onCountryCodeChanged("+55");
      var apiResponse = ApiResponse(error: ApiError(500, "Unkown", true, ""));
      when(mockUserRepo.requestSmsCode("55", "31993942106"))
          .thenAnswer((_) async => Future.value(apiResponse));

      //When
      await sut.requestCode();
      //Then
      expect(sut.state, ViewState.Error);
      expect(sut.vm.errorMsg, startsWith("Algo de errado aconteceu: "));
    });

  });



  test("Get SmsCode returns success", () async {
    //Given

    final mockUserRepo = MockUserRepo();

    var apiResponse = ApiResponse(results: ["result"], error: null);
    when(mockUserRepo.requestSmsCode("", "")).thenAnswer((_) async => Future.value(apiResponse));
    var response = await mockUserRepo.requestSmsCode("", "");

    expect(null, response.error);
  });



  test("When login is completed true is returned", () async {
    //Given
    final response = ApiResponse(results: [], error: null);
    when(mockUserRepo.loginWithPhone(any, any, any)).thenAnswer((_) => Future.value(response));

    //When
    final future = await sut.loginWithPhone();

    //Then
    expect(true, future);
  });

  test("Login is called with correct parameters", () {
    //Given
    final phoneNumber = "31993942106";
    final countryCode = "55";
    final smsCode = "1234";

    sut.onCountryCodeChanged("+55");
    sut.onPhoneChanged("(31) 993942106");
    sut.onSmsCodeChanged("1234");

    //When
    sut.loginWithPhone();

    //Then

    verify(mockUserRepo.loginWithPhone(countryCode, phoneNumber, smsCode));
  });
}
