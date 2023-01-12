import 'package:entreggue_restaurant/application/presentation/widgets/dialogs/remove_courier_dialog.dart';
import 'package:entreggue_restaurant/data/models/store_id_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CourierInfo extends StatelessWidget {
  const CourierInfo({
    required this.courierId,
    Key? key,
  }) : super(key: key);

  final String courierId;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context)!.courierInfo,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor.withOpacity(0.2),
                    fontSize: 18),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('ID: $courierId'),
                  IconButton(
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: courierId));
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(AppLocalizations.of(context)!
                                .copiedToClipBoard)));
                      },
                      icon: const Icon(
                        Icons.copy,
                        size: 20,
                      ))
                ],
              ),
              QrImage(
                data: '$courierId,$storeIdModelString',
                version: QrVersions.auto,
                size: 200.0,
              ),
              const SizedBox(
                height: 100,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: MaterialButton(
                    onPressed: () async {
                      RemoveCourierDialog(context: context)
                          .showRemoveCourierDialog(courierId);
                    },
                    color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        AppLocalizations.of(context)!.removeCourier,
                        style: const TextStyle(color: Colors.black),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
