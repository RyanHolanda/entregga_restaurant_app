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
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: MediaQuery.of(context).size.height / 1.5,
                decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 15,
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.05))
                    ],
                    borderRadius: BorderRadius.circular(
                        constraints.maxWidth > 700 ? 30 : 0)),
                child: CourierInfo(courierId: courierId),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(20),
                height: MediaQuery.of(context).size.height / 1.5,
                decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 15,
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.05))
                    ],
                    borderRadius: BorderRadius.circular(
                        constraints.maxWidth > 700 ? 30 : 0)),
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
            const SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(20),
                width: 300,
                height: MediaQuery.of(context).size.height / 1.5,
                decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 15,
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.05))
                    ],
                    borderRadius: BorderRadius.circular(
                        constraints.maxWidth > 700 ? 30 : 0)),
                child: PasOrdersFromCourier(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
