import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class CreatePaymentOrderCall {
  static Future<ApiCallResponse> call({
    String? orderId = '',
    double? orderAmount,
    String? orderCurrency = '',
    String? customerId = '',
    String? customerEmail = '',
    String? customerPhone = '',
  }) {
    final body = '''
{
  "customer_details": {
    "customer_id": "${customerId}",
    "customer_email": "${customerEmail}",
    "customer_phone": "${customerPhone}"
  },
  "order_id": "${orderId}",
  "order_amount": ${orderAmount},
  "order_currency": "${orderCurrency}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CreatePayment Order',
      apiUrl: 'https://sandbox.cashfree.com/pg/orders',
      callType: ApiCallType.POST,
      headers: {
        'accept': 'application/json',
        'x-api-version': '2022-09-01',
        'x-client-id': '19061216a1fe6b37a4fab8110d216091',
        'x-client-secret': 'c2d308ad20ca5edbb962d8d17d186f3a7b5cd43b',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic cforderid(dynamic response) => getJsonField(
        response,
        r'''$.cf_order_id''',
      );
  static dynamic createdat(dynamic response) => getJsonField(
        response,
        r'''$.created_at''',
      );
  static dynamic customerdetailscustomerid(dynamic response) => getJsonField(
        response,
        r'''$.customer_details.customer_id''',
      );
  static dynamic customerdetailscustomeremail(dynamic response) => getJsonField(
        response,
        r'''$.customer_details.customer_email''',
      );
  static dynamic customerdetailscustomerphone(dynamic response) => getJsonField(
        response,
        r'''$.customer_details.customer_phone''',
      );
  static dynamic entity(dynamic response) => getJsonField(
        response,
        r'''$.entity''',
      );
  static dynamic orderamount(dynamic response) => getJsonField(
        response,
        r'''$.order_amount''',
      );
  static dynamic ordercurrency(dynamic response) => getJsonField(
        response,
        r'''$.order_currency''',
      );
  static dynamic orderexpirytime(dynamic response) => getJsonField(
        response,
        r'''$.order_expiry_time''',
      );
  static dynamic orderid(dynamic response) => getJsonField(
        response,
        r'''$.order_id''',
      );
  static dynamic orderstatus(dynamic response) => getJsonField(
        response,
        r'''$.order_status''',
      );
  static dynamic paymentsessionid(dynamic response) => getJsonField(
        response,
        r'''$.payment_session_id''',
      );
  static dynamic messageError(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic errorCode(dynamic response) => getJsonField(
        response,
        r'''$.code''',
      );
  static dynamic errorType(dynamic response) => getJsonField(
        response,
        r'''$.type''',
      );
}

class CheckOrderStatusCall {
  static Future<ApiCallResponse> call({
    String? paymentSessionId = '',
    String? channel = '',
    String? upiId = '',
    int? upiExpiryMinutes,
    String? orderId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Check order status',
      apiUrl: 'https://sandbox.cashfree.com/pg/orders/${orderId}',
      callType: ApiCallType.GET,
      headers: {
        'accept': 'application/json',
        'x-api-version': '2022-09-01',
        'x-client-id': '19061216a1fe6b37a4fab8110d216091',
        'x-client-secret': 'c2d308ad20ca5edbb962d8d17d186f3a7b5cd43b',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic cforderid(dynamic response) => getJsonField(
        response,
        r'''$.cf_order_id''',
      );
  static dynamic entity(dynamic response) => getJsonField(
        response,
        r'''$.entity''',
      );
  static dynamic orderid(dynamic response) => getJsonField(
        response,
        r'''$.order_id''',
      );
  static dynamic orderstatus(dynamic response) => getJsonField(
        response,
        r'''$.order_status''',
      );
  static dynamic paymentsessionid(dynamic response) => getJsonField(
        response,
        r'''$.payment_session_id''',
      );
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

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
