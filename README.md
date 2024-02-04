```markdown
# UniShipping

UniShipping is a Flutter package designed to integrate shipping functionalities into your e-commerce application or any system that requires coordination with shipping partners to dispatch products to customers. It simplifies the interaction with shipping APIs, making it easy to manage orders and shipments.

## Features

- Initialize the package with your client credentials.
- Create orders to be shipped to your customers.
- Retrieve details of a single order.
- Initiate the shipment process for an order.

Currently, UniShipping is tailored to work with the TOTROD shipping company, providing a streamlined way to handle logistics directly from your application.

## Getting Started

To use UniShipping in your Flutter project, follow these steps:

### Installation

1. Add UniShipping to your `pubspec.yaml` file:

```yaml
dependencies:
  uni_shipping: latest_version
```

2. Run `flutter pub get` to install the package.

### Usage

Import UniShipping in your Dart file:

```dart
import 'package:uni_shipping/uni_shipping.dart';
```

Initialize UniShipping with your client credentials and the environment setting:

```dart
void main() {
  UniShippingConfigs.init(
    clientId: 'YourClientId',
    clientSecret: 'YourClientSecret',
    environment: UniShippingEnvironment.staging,
  );

  runApp(const MyApp());
}
```

#### Create an Order

```dart
CreateOrderDTO createOrderBody = CreateOrderDTO(
  // Your order details
);
CreateOrderRes createOrderRes = await UniShippingOrders.createOrder(createOrderBody);
```

#### Get Single Order

```dart
OrderModel singleOrder = await UniShippingOrders.getSingleOrder('YourOrderID');
```

#### Create Shipment Process

```dart
CreateshipmentDTO createShipProcessBody = CreateshipmentDTO(
  // Your shipment details
);
ChipOrderResponse createShipProcessRes = await UniShippingShippment.createShipProcess(createShipProcessBody);
```

## Example

An example application demonstrating how to use UniShipping is included in the package. Check the `example` directory for more details.

## Contributing

Contributions are welcome! If you would like to contribute, please fork the repository and submit a pull request.

## License

UniShipping is available under the [MIT license](LICENSE). See the LICENSE file for more info.
```
