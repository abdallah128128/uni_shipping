/// This file contains all the enums used in the app.

/// Enum for the Payment Method of the order
enum PaymentMethod {
  /// 1- COD (Cash on Delivery)
  cod,

  /// 2- Prepaid [Online Payment]
  prepaid,

  /// 3- Bank [Bank Transfer]
  bank;

  String get value {
    switch (this) {
      case PaymentMethod.cod:
        return 'COD';
      case PaymentMethod.prepaid:
        return 'Prepaid';
      case PaymentMethod.bank:
        return 'Bank';
      default:
        return 'Prepaid';
    }
  }
}

/// Enum for the Address Type of the order
enum AddressType {
  /// 1- LatLong [Latitude and Longitude]
  latlong,
}

/// Enum for the Shipment Type of the order
enum ShipmentType {
  /// Normal Shipment
  normal,

  /// Cold Shipment [for cold items]
  cold,

  /// Quick Shipment [for quick delivery]
  quick;
}
