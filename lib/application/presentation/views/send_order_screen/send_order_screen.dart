import 'package:entreggue_restaurant/application/bloc/bloc/app_bloc.dart';
import 'package:entreggue_restaurant/application/presentation/views/send_order_screen/mobile/send_order_screen_mobile.dart';
import 'package:entreggue_restaurant/application/presentation/views/send_order_screen/web/send_order_screen_web.dart';
import 'package:entreggue_restaurant/application/presentation/widgets/dialogs/add_address_error.dart';
import 'package:entreggue_restaurant/application/presentation/widgets/dialogs/remove_courier_dialog.dart';
import 'package:entreggue_restaurant/application/presentation/widgets/dialogs/sign_out_dialog.dart';
import 'package:entreggue_restaurant/data/models/adresses_model.dart';
import 'package:entreggue_restaurant/data/models/store_id_model.dart';
import 'package:entreggue_restaurant/domain/text_controllers/text_controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:qr_flutter/qr_flutter.dart';

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
