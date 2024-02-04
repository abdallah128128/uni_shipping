class EndPoints {
  EndPoints._();

  //* Orders Endpoints ---------------------
  /// Create order
  static const String createOrder = 'order/create';
  /// Get single order details
  static const String orderDetails = 'order/details';

  //* Shipments Endpoints ---------------------
  /// Create shipment Process
  static const String orderShipProcess = 'order/ship/process';
}
