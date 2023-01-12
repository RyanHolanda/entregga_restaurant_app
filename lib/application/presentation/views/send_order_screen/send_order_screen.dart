import 'package:entreggue_restaurant/application/presentation/views/send_order_screen/mobile/send_order_screen_mobile.dart';
import 'package:entreggue_restaurant/application/presentation/views/send_order_screen/web/send_order_screen_web.dart';
import 'package:flutter/material.dart';

class SendOrderScreen extends StatelessWidget {
  const SendOrderScreen(
      {super.key, required this.couriernName, required this.courierId});

  final String courierId;
  final String couriernName;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
            body: constraints.maxWidth > 700
                ? SendOrderScreenWeb(
                    constraints: constraints,
                    courierId: courierId,
                    couriernName: couriernName)
                : SendOrderScreeMobile(
                    constraints: constraints,
                    couriernName: couriernName,
                    courierId: courierId));
      },
    );
  }
}
