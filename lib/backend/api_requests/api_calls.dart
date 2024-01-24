import 'dart:convert';
import 'dart:typed_data';
import '../cloud_functions/cloud_functions.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetNearbyLocationsIdCall {
  static Future<ApiCallResponse> call({
    int? radius1,
    int? radius2,
    String? centerLat = '',
    String? centerLon = '',
    String? queryString = '',
    String? limit = '60',
  }) async {
    final ffApiRequestBody = '''
{
  "radius1": ${radius1},
  "radius2": ${radius2},
  "center_lat": "${centerLat}",
  "center_lon": "${centerLon}",
  "query_string": "${queryString}",
  "limit": "${limit}",
  "api_key": "EhdQUTM2K0hNLCBOYWlyb2JpLCBLZW55YSImOiQKCg2PPDr"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetNearbyLocationsId',
      apiUrl: 'https://100086.pythonanywhere.com/accounts/get-local-nearby-v2/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? iDsList(dynamic response) => (getJsonField(
        response,
        r'''$.place_id_list''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? centerCoordinate(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.center_loc''',
      ));
}

class GetCoordinatesCall {
  static Future<ApiCallResponse> call({
    String? location = '',
  }) async {
    final ffApiRequestBody = '''
{
  "region": "${location}",
 "api_key": "EhdQUTM2K0hNLCBOYWlyb2JpLCBLZW55YSImOiQKCg2PPDr"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetCoordinates',
      apiUrl:
          'https://100074.pythonanywhere.com/get-coords-v3/?api_key=4f0bd662-8456-4b2e-afa6-293d4135facf',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static double? lat(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data[:].lat''',
      ));
  static double? lng(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data[:].lon''',
      ));
  static String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].name''',
      ));
}

class DowellSendEmailCall {
  static Future<ApiCallResponse> call({
    String? toEmail = '',
    String? toName = '',
    String? message = '',
    String? title = 'Searching Nearby Locations Results',
  }) async {
    final ffApiRequestBody = '''
{
  "toname": "${toName}",
  "toemail": "${toEmail}",
  "subject": "${title}",
  "email_content": "${message}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'DowellSendEmail',
      apiUrl: 'https://100085.pythonanywhere.com/api/email/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class SubscribeToNewsLetterCall {
  static Future<ApiCallResponse> call({
    String? subscriberEmail = '',
  }) async {
    final ffApiRequestBody = '''
{
  "topic": "newsletter1",
  "subscriberEmail": "${subscriberEmail}",
  "typeOfSubscriber": "public"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SubscribeToNewsLetter',
      apiUrl:
          'https://100085.pythonanywhere.com/uxlivinglab/newsletter/v1/4f0bd662-8456-4b2e-afa6-293d4135facf/?type=subscribe_newsletter',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class MakePaymentCall {
  static Future<ApiCallResponse> call({
    int? price,
    String? product = '',
    String? currencyCode = '',
  }) async {
    final ffApiRequestBody = '''
{
  "price": ${price},
  "product": "${product}",
  "currency_code":"${currencyCode}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'MakePayment',
      apiUrl: 'https://100088.pythonanywhere.com/api/stripe/initialize',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Api-Key sgwF6fcb.RJKV99CLmI8TPM6op4SiZN9PukDJRU2p',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? detailsPageUrl(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.approval_url''',
      ));
  static String? paymentId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.payment_id''',
      ));
}

class GetCitiesCall {
  static Future<ApiCallResponse> call({
    String? country = 'italy',
  }) async {
    final ffApiRequestBody = '''
{
  "country": "${country}",
  "query": "all"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetCities',
      apiUrl:
          'https://100074.pythonanywhere.com/get-coords-v3/?api_key=4f0bd662-8456-4b2e-afa6-293d4135facf',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? citiesName(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<double>? lat(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].lat''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List<double>? lng(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].lon''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  static List? cityList(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class GetCategoriesCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetCategories',
      apiUrl:
          'https://100086.pythonanywhere.com/accounts/get-categories/?api_key=EhdQUTM2K0hNLCBOYWlyb2JpLCBLZW55YSImOiQKCg2PPDr',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic categories(dynamic response) => getJsonField(
        response,
        r'''$.categories''',
      );
}

class GetNearbyLocationsCall {
  static Future<ApiCallResponse> call({
    dynamic? placeIdsJson,
    String? centerCoord = '',
  }) async {
    final placeIds = _serializeJson(placeIdsJson);
    final ffApiRequestBody = '''
{
  "place_id_list": ${placeIds},
  "center_loc": "${centerCoord}",
  "api_key": "EhdQUTM2K0hNLCBOYWlyb2JpLCBLZW55YSImOiQKCg2PPDr"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetNearbyLocations',
      apiUrl:
          'https://100086.pythonanywhere.com/accounts/get-details-list-stage1/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? locationList(dynamic response) => getJsonField(
        response,
        r'''$.succesful_results''',
        true,
      ) as List?;
  static List<String>? coordinates(dynamic response) => (getJsonField(
        response,
        r'''$.succesful_results[:].location_coord''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? placeID(dynamic response) => (getJsonField(
        response,
        r'''$.succesful_results[:].placeId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? placeName(dynamic response) => (getJsonField(
        response,
        r'''$.succesful_results[:].place_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? category(dynamic response) => getJsonField(
        response,
        r'''$.succesful_results[:].category''',
        true,
      ) as List?;
  static List<String>? address(dynamic response) => (getJsonField(
        response,
        r'''$.succesful_results[:].address''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? dayHours(dynamic response) => (getJsonField(
        response,
        r'''$.succesful_results[:].day_hours''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? phone(dynamic response) => (getJsonField(
        response,
        r'''$.succesful_results[:].phone''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? website(dynamic response) => (getJsonField(
        response,
        r'''$.succesful_results[:].website''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? photo(dynamic response) => (getJsonField(
        response,
        r'''$.succesful_results[:].photo_reference''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? rating(dynamic response) => (getJsonField(
        response,
        r'''$.succesful_results[:].rating''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<bool>? error(dynamic response) => (getJsonField(
        response,
        r'''$.succesful_results[:].error''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  static List? failedResult(dynamic response) => getJsonField(
        response,
        r'''$.failed_results''',
        true,
      ) as List?;
}

class CalculateDistanceCall {
  static Future<ApiCallResponse> call({
    String? origins = '',
    String? destinations = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CalculateDistanceCall',
        'variables': {
          'origins': origins,
          'destinations': destinations,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static List<String>? distance(dynamic response) => (getJsonField(
        response,
        r'''$.rows[:].elements[:].distance.text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class CheckCredSysCall {
  static Future<ApiCallResponse> call() async {
    final ffApiRequestBody = '''
{
    "sub_service_ids": ["DOWELL100231", "DOWELL100232", "DOWELL100233", "DOWELL100234", "DOWELL100235"],
    "service_id": "DOWELL10023"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CheckCredSys',
      apiUrl:
          'https://100105.pythonanywhere.com/api/v3/process-services/?type=product_service&api_key=0360fae8-16f6-40ce-91c2-46c6371509cf',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CountrylistCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'countrylist',
      apiUrl:
          'https://100074.pythonanywhere.com/get-countries-v3/?api_key=4f0bd662-8456-4b2e-afa6-293d4135facf',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? listodcountries(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].countries''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetCoordinatesAPINewCall {
  static Future<ApiCallResponse> call({
    String? country = 'italy',
    String? city = '',
    String? query = 'custom',
  }) async {
    final ffApiRequestBody = '''
{
  "country": "${country}",
  "query": "${query}",
  "regionList": [
    "${city}"
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'get coordinates API  new',
      apiUrl:
          'https://100074.pythonanywhere.com/get-coords-v3/?api_key=4f0bd662-8456-4b2e-afa6-293d4135facf',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? cordinateLocationData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  static String? placeName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].name''',
      ));
  static String? originLatLng(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data[:].coordinates''',
      ));
  static double? latitude(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data[:].lat''',
      ));
  static double? longitude(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data[:].lon''',
      ));
  static String? countryCode(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data[:].country_code''',
      ));
  static String? continent(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].continent''',
      ));
  static String? countryName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data[:].country''',
      ));
  static bool? isSuccess(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
}

class HealthCheckUPCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Health Check UP',
      apiUrl:
          'https://100105.pythonanywhere.com/api/v3/experience_database_services/?type=healt_check',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ExperiencedServiceUserDetailsCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    int? occurrences,
  }) async {
    final ffApiRequestBody = '''
{
  "email": "${email}",
  "product_number": "UXLIVINGLAB001",
  "occurrences": ${occurrences}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Experienced service User details',
      apiUrl:
          'https://100105.pythonanywhere.com/api/v3/experience_database_services/?type=experienced_service_user_details',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ExperiencedUserDataBaseCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? content = '',
    String? title = '',
  }) async {
    final ffApiRequestBody = '''
{
  "product_name": "SAMANTA CONTENT EVALUATOR",
  "email": "${email}",
  "experienced_data": {
    "Title": "${title}",
    "Content": "${content}",
    "email": "${email}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Experienced User DataBase',
      apiUrl:
          'https://100105.pythonanywhere.com/api/v3/experience_database_services/?type=experienced_user_details',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class RegisterAnUserCall {
  static Future<ApiCallResponse> call({
    String? email = '',
  }) async {
    final ffApiRequestBody = '''
{
  "product_number": "UXLIVINGLAB001",
  "email": "${email}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Register an User',
      apiUrl:
          'https://100105.pythonanywhere.com/api/v3/experience_database_services/?type=register_user',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class UserEmailInfoCall {
  static Future<ApiCallResponse> call({
    String? email = 'manish@dowellresearch.in',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'User Email Info',
      apiUrl:
          'https://100105.pythonanywhere.com/api/v3/experience_database_services/',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'email': email,
        'type': "get_user_email",
        'product_number': "UXLIVINGLAB001",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateUserUsageCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    int? occurrences,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Update User Usage',
      apiUrl:
          'https://100105.pythonanywhere.com/api/v3/experience_database_services/',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'type': "update_user_usage",
        'product_number': "UXLIVINGLAB001",
        'email': email,
        'occurrences': occurrences,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class RegisteredUserDetailsCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Registered user details',
      apiUrl:
          'https://100105.pythonanywhere.com/api/v3/experience_database_services/?type=get_registered_user&email=manish@dowellresearch.in&product_number=UXLIVINGLAB001',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
