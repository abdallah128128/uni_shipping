import 'package:uni_shipping/uni_shipping.dart';

/// Create Order DTO [Data Transfer Object] -- Body Data to create a new order
class CreateOrderDTO {
  final String name;
  final String email;
  final String phone;
  final String itemDescription;
  final String orderTotal;
  final PaymentMethod paymentMethod;

  /// Weight in [KG]
  final num weight;
  final int noOfBox;
  final AddressDTO addressDTO;

  CreateOrderDTO({
    required this.name,
    this.email = 'unicode@gmail.com',
    required this.phone,
    required this.itemDescription,
    required this.orderTotal,
    this.paymentMethod = PaymentMethod.prepaid,
    required this.weight,
    required this.noOfBox,
    required this.addressDTO,
  });

  Map<String, String> toJson() {
    return {
      'name': name,
      'email': email,
      'phone_number': phone,
      'item_description': itemDescription,
      'order_total': orderTotal,
      'payment': paymentMethod.value,
      'weight': weight.toString(),
      'no_of_box': noOfBox.toString(),
      ...addressDTO.toJson(),
    };
  }
}

/// Address DTO [Data Transfer Object] -- Body Data to create a new order
class AddressDTO {
  final AddressType addressType;
  final double latitude;
  final double longitude;

  AddressDTO({
    this.addressType = AddressType.latlong,
    required this.latitude,
    required this.longitude,
  });

  Map<String, dynamic> toJson() {
    return {
      'type': addressType.name,
      'latitude': latitude.toString(),
      'longitude': longitude.toString(),
    };
  }
}
