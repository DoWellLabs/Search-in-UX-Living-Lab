import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';
import '../cloud_functions/cloud_functions.dart';

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
  }) {
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
    );
  }

  static dynamic iDsList(dynamic response) => getJsonField(
        response,
        r'''$.place_id_list''',
        true,
      );
  static dynamic centerCoordinate(dynamic response) => getJsonField(
        response,
        r'''$.center_loc''',
      );
}

class GetCoordinatesCall {
  static Future<ApiCallResponse> call({
    String? location = '',
  }) {
    final ffApiRequestBody = '''
{
  "region": "${location}",
  "api_key": "EhdQUTM2K0hNLCBOYWlyb2JpLCBLZW55YSImOiQKCg2PPDr"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetCoordinates',
      apiUrl: 'https://100074.pythonanywhere.com/get-coords/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic lat(dynamic response) => getJsonField(
        response,
        r'''$.data.location.lat''',
      );
  static dynamic lng(dynamic response) => getJsonField(
        response,
        r'''$.data.location.lng''',
      );
}

class DowellSendEmailCall {
  static Future<ApiCallResponse> call({
    String? toEmail = '',
    String? toName = '',
    String? message = '',
    String? title = 'Searching Nearby Locations Results',
  }) {
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
    );
  }

  static dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
}

class SubscribeToNewsLetterCall {
  static Future<ApiCallResponse> call({
    String? subscriberEmail = '',
  }) {
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
    );
  }

  static dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
}

class MakePaymentCall {
  static Future<ApiCallResponse> call({
    int? price,
    String? product = '',
    String? currencyCode = '',
  }) {
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
    );
  }

  static dynamic detailsPageUrl(dynamic response) => getJsonField(
        response,
        r'''$.approval_url''',
      );
  static dynamic paymentId(dynamic response) => getJsonField(
        response,
        r'''$.payment_id''',
      );
}

class GetCitiesCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'GetCities',
      apiUrl:
          'https://100074.pythonanywhere.com/regions/johnDoe123/haikalsb1234/100074/?format=json',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic citiesName(dynamic response) => getJsonField(
        response,
        r'''$..name''',
        true,
      );
}

class GetCategoriesCall {
  static Future<ApiCallResponse> call() {
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
    );
  }

  static dynamic categories(dynamic response) => getJsonField(
        response,
        r'''$.categories''',
      );
}

class GetNearbyLocationsCall {
  static Future<ApiCallResponse> call({
    List<String>? placeIdsList,
    String? centerCoord = '',
  }) {
    final placeIds = _serializeList(placeIdsList);

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
    );
  }

  static dynamic locationList(dynamic response) => getJsonField(
        response,
        r'''$.succesful_results''',
        true,
      );
  static dynamic coordinates(dynamic response) => getJsonField(
        response,
        r'''$.succesful_results[:].location_coord''',
        true,
      );
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

  static dynamic distance(dynamic response) => getJsonField(
        response,
        r'''$.rows[:].elements[:].distance.text''',
        true,
      );
}

class CheckCredSysCall {
  static Future<ApiCallResponse> call() {
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
    );
  }
}

class ThreeCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'three',
      apiUrl: 'www.google.com',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
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
