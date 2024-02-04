import 'package:uni_shipping/uni_shipping.dart';

/// Response model for create order api [order/create]
class CreateOrderRes {
  bool? status;
  int? code;
  String? message;
  OrderModel? data;

  CreateOrderRes({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  CreateOrderRes.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? OrderModel.fromJson(json['data']) : null;
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
