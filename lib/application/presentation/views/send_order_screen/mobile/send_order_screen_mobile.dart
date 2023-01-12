import 'package:entreggue_restaurant/application/presentation/widgets/send_order_widgets/courier_info.dart';
import 'package:entreggue_restaurant/application/presentation/widgets/send_order_widgets/past_orders.dart';
import 'package:entreggue_restaurant/application/presentation/widgets/send_order_widgets/send_order.dart';
import 'package:flutter/material.dart';

class SendOrderScreeMobile extends StatelessWidget {
  const SendOrderScreeMobile({
    Key? key,
    required this.couriernName,
    required this.courierId,
    required this.constraints,
  }) : super(key: key);

  final String couriernName;
  final String courierId;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: 200,
                    child: InkWell(
                      highlightColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () => Navigator.pop(context),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.navigate_before,
                            size: 25,
                          ),
                          SizedBox(
                            width: 150,
                            child: Text(
                              couriernName,
                              style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 18,
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
              const SizedBox(
                height: 50,
              ),
              CourierInfo(courierId: courierId),
              const SizedBox(
                height: 50,
              ),
              SizedBox(height: 500, child: PasOrdersFromCourier())
            ],
          ),
        ),
      ),
    );
  }
}
