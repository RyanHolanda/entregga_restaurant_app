import 'package:entreggue_restaurant/application/presentation/widgets/send_order_widgets/courier_info.dart';
import 'package:entreggue_restaurant/application/presentation/widgets/send_order_widgets/past_orders.dart';
import 'package:entreggue_restaurant/application/presentation/widgets/send_order_widgets/send_order.dart';
import 'package:flutter/material.dart';

class SendOrderScreenWeb extends StatelessWidget {
  const SendOrderScreenWeb({
    Key? key,
    required this.courierId,
    required this.constraints,
    required this.couriernName,
  }) : super(key: key);

  final String courierId;
  final String couriernName;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: CourierInfo(courierId: courierId),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 5,
                        spreadRadius: 1,
                        color: Theme.of(context).primaryColor.withOpacity(0.05))
                  ]),
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: InkWell(
                              onTap: () => Navigator.pop(context),
                              child: SizedBox(
                                width: 250,
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.navigate_before,
                                      size: 25,
                                    ),
                                    SizedBox(
                                      width: 200,
                                      child: Text(
                                        couriernName,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          overflow: TextOverflow.ellipsis,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SendAddressWidget(
                            courierId: courierId,
                            constraints: constraints,
                            couriernName: couriernName),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: PasOrdersFromCourier(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
