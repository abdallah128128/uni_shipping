import 'package:uni_shipping/uni_shipping.dart';

/// Create Order Res Data -- contains all the details of a Created order
class OrderModel {
  String orderId;
  String storeId;
  String status;
  String payment;
  int total;
  String totalString;
  String itemDescription;
  int noOfBox;
  String weight;
  String createdAt;
  CustomerData customerData;
  List<ProductData> productData;
  DeliveryAddress deliveryAddress;
  String? trackingId;

  OrderModel({
    required this.orderId,
    required this.storeId,
    required this.status,
    required this.payment,
    required this.total,
    required this.totalString,
    required this.itemDescription,
    required this.noOfBox,
    required this.weight,
    required this.createdAt,
    required this.customerData,
    required this.productData,
    required this.deliveryAddress,
    required this.trackingId,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      orderId: json['order_id'],
      storeId: json['store_id'],
      status: json['status'],
      payment: json['payment'],
      total: json['total'],
      totalString: json['total_string'],
      itemDescription: json['item_description'],
      noOfBox: json['no_of_box'],
      weight: json['weight'],
      createdAt: json['created_at'],
      customerData: CustomerData.fromJson(json['customer_data']),
      productData: List<ProductData>.from(json['product_data'].map((x) => ProductData.fromJson(x))),
      deliveryAddress: DeliveryAddress.fromJson(json['delivery_address']),
      trackingId: json['tracking_id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'order_id': orderId,
      'store_id': storeId,
      'status': status,
      'payment': payment,
      'total': total,
      'total_string': totalString,
      'item_description': itemDescription,
      'no_of_box': noOfBox,
      'weight': weight,
      'created_at': createdAt,
      'customer_data': customerData.toJson(),
      'product_data': productData.map((e) => e.toJson()).toList(),
      'delivery_address': deliveryAddress.toJson(),
      'tracking_id': trackingId,
    };
  }
}
