import 'package:flutter/material.dart';
import 'package:uni_shipping/uni_shipping.dart';

const String clientId = 'your_client_id_here';
const String clientSecret = 'your_client_secret_here';

void main() {
  UniShippingConfigs.init(
    clientId: clientId,
    clientSecret: clientSecret,
    environment: UniShippingEnvironment.staging,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UniShipping Example',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('UniShipping Example'),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Welcome to UniShipping Example',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),

              //* Create Order -------------------------------------
              ElevatedButton(
                onPressed: () async {
                  CreateOrderDTO createOrderBody = CreateOrderDTO(
                    name: 'CLIENT_NAME',
                    phone: 'CLIENT_PHONE',
                    itemDescription: 'Item Description',
                    orderTotal: 'ORDER_TOTAL',
                    // Weight in KG
                    weight: 10,
                    noOfBox: 1,
                    addressDTO: AddressDTO(
                      // Client Address
                      latitude: 24.8413865,
                      longitude: 46.7332576,
                    ),
                  );
                  try {
                    CreateOrderRes createOrderRes = await UniShippingOrders.createOrder(createOrderBody);
                    debugPrint('Success: ${createOrderRes.data?.toJson()}');
                  } catch (e) {
                    debugPrint(e.toString());
                  }
                },
                child: const Text('Create Order'),
              ),
              const SizedBox(height: 20),

              //* Get Single Order -------------------------------------
              ElevatedButton(
                onPressed: () async {
                  try {
                    OrderModel singleOrder = await UniShippingOrders.getSingleOrder('ORDER_ID_HERE');
                    debugPrint('Success: ${singleOrder.toJson()}');
                  } catch (e) {
                    debugPrint(e.toString());
                  }
                },
                child: const Text('Get Single Order'),
              ),

              const SizedBox(height: 20),
              //* Create Shipment Process -------------------------------------
              ElevatedButton(
                onPressed: () async {
                  CreateshipmentDTO createShipProcessBody = CreateshipmentDTO(
                    orderId: 'ORDER_ID_HERE',
                    warehouse: 'WAREHOUSE_ID_HERE',
                    courierPartnerId: 'COURIER_PARTNER_ID_HERE',
                  );
                  try {
                    ChipOrderResponse createShipProcessRes =
                        await UniShippingShippment.createShipProcess(createShipProcessBody);
                    debugPrint('Success: ${createShipProcessRes.data?.toJson()}');
                  } catch (e) {
                    debugPrint(e.toString());
                  }
                },
                child: const Text('Create Shipment Process'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
