import 'package:http/http.dart' as http;
import 'package:uni_shipping/src/core/utils.dart';
import 'package:uni_shipping/uni_shipping.dart';

class UniShippingShippment {
  UniShippingShippment._();

  /// Create order api -- to create a new order
  static Future<ChipOrderResponse> createShipProcess(CreateshipmentDTO createShipProcessBody) async {
    String url = UniShippingConfigs.environment.baseUrl + EndPoints.orderShipProcess;
    String token = await UniShippingConfigs.token;
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields.addAll(createShipProcessBody.toJson());
    request.headers.addAll({'Accept': 'application/json', 'Authorization': 'Bearer $token'});
    http.StreamedResponse response = await request.send();
    final body = await Utils.toMap(response);
    if (response.statusCode != 200) {
      throw ClientException(response.statusCode, response.reasonPhrase, response.headers, body.toString());
    } else {
      return ChipOrderResponse.fromJson(body);
    }
  }
}
