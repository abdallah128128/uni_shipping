import 'package:uni_shipping/uni_shipping.dart';

/// Response model for get single order api [order/details]
class GetSingleOrderRes {
  /// Status of the order api
  bool status;

  /// Status code of the order api
  int? code;

  /// Message from the order api
  String? message;

  /// Single order data
  OrderModel? data;

  GetSingleOrderRes({
    this.status = false,
    this.code,
    this.message,
    this.data,
  });

  factory GetSingleOrderRes.fromJson(Map<String, dynamic> json) {
    return GetSingleOrderRes(
      status: json['status'] ?? false,
      code: json['code'],
      message: json['message'],
      data: json['data'] != null ? OrderModel.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'code': code,
      'message': message,
      'data': data?.toJson(),
    };
  }
}
