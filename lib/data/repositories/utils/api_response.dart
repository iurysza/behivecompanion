import 'package:behivecompanion/data/repositories/utils/api_error.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class ApiResponse<T extends Object> {
  final List<T> results;
  final ApiError error;

  bool isError() {
    return error != null;
  }

  ApiResponse({this.results, this.error});
}

ApiResponse getApiResponse(ParseResponse response) {
  var list = response.results;
  var single = response.result;

  var data;
  if (response.results != null) {
    data = list;
  } else {
    if (single is List) {
      data = List.castFrom<Object, Map<String, Object>>(single);
    } else {
      data = List.castFrom<Object, Map<String, Object>>([single]);
    }
  }

  return ApiResponse(results: data, error: getApiError(response.error));
}

ApiError getApiError(ParseError response) {
  if (response == null) {
    return null;
  }

  return ApiError(response.code, response.message, response.isTypeOfException, response.type);
}

ApiResponse<T> getResponseOf<T>(List<dynamic> data) {
  return ApiResponse<T>(results: List.castFrom<dynamic,T>(data), error: null);
}

/// Handles a response with a single result object
T getParseObjectFrom<T extends ParseObject>(T object, Map<String, dynamic> map) {
  return object..fromJson(map);
}
