import 'package:parse_server_sdk/parse_server_sdk.dart';

import 'package:behivecompanion/data/repositories/utils/api_error.dart';
import 'package:test/test.dart';

class ApiResponse {
  final List<dynamic> results;
  final ApiError error;

  bool isError() {
    return error != null;
  }

  ApiResponse(this.results, this.error);
}

ApiResponse getApiResponse<T>(ParseResponse response) {
  return ApiResponse(response.results as List<T>, getApiError(response.error));
}

ApiError getApiError(ParseError response) {
  if (response == null) {
    return null;
  }

  return ApiError(response.code, response.message, response.isTypeOfException,
      response.type);
}
