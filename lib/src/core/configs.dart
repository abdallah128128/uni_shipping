import 'package:http/http.dart' as http;
import 'package:uni_shipping/src/core/client_exception.dart';
import 'package:uni_shipping/src/core/utils.dart';

/// Class to hold the configurations of the UniShipping
class UniShippingConfigs {
  UniShippingConfigs._();

  /// The client id of the UniShipping
  static String _clientId = '';

  /// The client secret of the UniShipping
  static String _clientSecret = '';

  /// The environment of the UniShipping [production] or [staging]
  static UniShippingEnvironment _environment = UniShippingEnvironment.staging;

  static UniShippingEnvironment get environment => _environment;

  /// The token that is used to authenticate the user
  static String? _token;

  /// Initialize the UniShippingConfigs with the given [clientId], [clientSecret], and [environment]
  static void init({
    required String clientId,
    required String clientSecret,
    required UniShippingEnvironment environment,
  }) {
    UniShippingConfigs._clientId = clientId;
    UniShippingConfigs._clientSecret = clientSecret;
    UniShippingConfigs._environment = environment;
  }

  /// Get token from the server with the given [client_id] and [client_secret] to authenticate the user
  static Future<String> get token async {
    String url = '${UniShippingConfigs._environment.baseUrl}token';
    var headers = {'Accept': 'application/json'};
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields
        .addAll({'client_id': UniShippingConfigs._clientId, 'client_secret': UniShippingConfigs._clientSecret});
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    final body = await Utils.toMap(response);
    if (response.statusCode != 200) {
      throw ClientException(response.statusCode, response.reasonPhrase, response.headers, '');
    } else {
      _token = body['data']['bearer_token'];
      return _token!;
    }
  }
}

/// Enum for the environment of the UniShipping
enum UniShippingEnvironment {
  production,
  staging;

  String get baseUrl {
    switch (this) {
      case UniShippingEnvironment.production:
        return 'https://torod.co/en/api/';
      case UniShippingEnvironment.staging:
        return 'https://demo.stage.torod.co/en/api/';
    }
  }
}
