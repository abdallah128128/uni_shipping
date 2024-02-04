import 'package:http/http.dart' as http;
import 'package:uni_shipping/src/core/utils.dart';
import 'package:uni_shipping/uni_shipping.dart';

/// Orders class -- contains all the methods related to orders
/// 1- Get single order details
/// 2- Create order
class UniShippingOrders {
  UniShippingOrders._();

  /// Get single order details ---------------------
  static Future<OrderModel> getSingleOrder(String orderId) async {
    String url = UniShippingConfigs.environment.baseUrl + EndPoints.orderDetails;
    String token = await UniShippingConfigs.token;
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields.addAll({'order_id': orderId});
    request.headers.addAll({'Accept': 'application/json', 'Authorization': 'Bearer $token'});
    http.StreamedResponse response = await request.send();
    final body = await Utils.toMap(response);
    if (response.statusCode != 200) {
      throw ClientException(response.statusCode, response.reasonPhrase, response.headers, body.toString());
    } else {
      return OrderModel.fromJson(body['data']);
    }
  }

  /// Create order api -- to create a new order
  static Future<CreateOrderRes> createOrder(CreateOrderDTO createOrderBody) async {
    String url = UniShippingConfigs.environment.baseUrl + EndPoints.createOrder;
    String token = await UniShippingConfigs.token;
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields.addAll(createOrderBody.toJson());
    request.headers.addAll({'Accept': 'application/json', 'Authorization': 'Bearer $token'});
    http.StreamedResponse response = await request.send();
    final body = await Utils.toMap(response);
    if (response.statusCode != 200) {
      throw ClientException(response.statusCode, response.reasonPhrase, response.headers, body.toString());
    } else {
      return CreateOrderRes.fromJson(body);
    }
  }
}
