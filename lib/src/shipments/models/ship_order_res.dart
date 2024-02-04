/// Response model for ship order api [order/ship/process]
class ChipOrderResponse {
  bool status;
  int? code;
  String? message;
  ShipOrderData? data;

  ChipOrderResponse({
    this.status = false,
    this.code,
    this.message,
    this.data,
  });

  factory ChipOrderResponse.fromJson(Map<String, dynamic> json) {
    return ChipOrderResponse(
      status: json['status'] ?? false,
      code: json['code'],
      message: json['message'],
      data: json['data'] != null ? ShipOrderData.fromJson(json['data']) : null,
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

/// Ship order data ---------------------
class ShipOrderData {
  String trackingId;
  String awsLabel;

  ShipOrderData({
    required this.trackingId,
    required this.awsLabel,
  });

  factory ShipOrderData.fromJson(Map<String, dynamic> json) {
    return ShipOrderData(
      trackingId: json['tracking_id'],
      awsLabel: json['aws_label'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tracking_id': trackingId,
      'aws_label': awsLabel,
    };
  }
}
