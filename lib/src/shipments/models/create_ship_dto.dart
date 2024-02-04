import 'package:uni_shipping/uni_shipping.dart';

class CreateshipmentDTO {
  final String orderId;
  final String warehouse;
  final ShipmentType type;
  final String courierPartnerId;

  CreateshipmentDTO({
    required this.orderId,
    required this.warehouse,
    this.type = ShipmentType.normal,
    required this.courierPartnerId,
  });

  Map<String, String> toJson() {
    return {
      'order_id': orderId,
      'warehouse': warehouse,
      'type': type.name,
      'courier_partner_id': courierPartnerId,
    };
  }
}
