import 'package:entreggue_restaurant/application/bloc/bloc/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RemoveCourierDialog {
  RemoveCourierDialog({required this.context});
  BuildContext context;
  showRemoveCourierDialog(courierId) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) => SimpleDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        alignment: Alignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(color: Colors.white),
            height: 300,
            width: 300,
            child: Center(
              child: Column(
                children: [
                  Text(
                    AppLocalizations.of(context)!.areYouSure,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.red,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Text(
                    AppLocalizations.of(context)!
                        .areYouSureRemoveCourierDescription,
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: SizedBox(
                        width: 150,
                        child: MaterialButton(
                            color: Colors.red,
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Text(AppLocalizations.of(context)!.remove),
                            ),
                            onPressed: () async {
                              Future removeCourier() async {
                                context.read<AppBloc>().add(
                                    AppEventDeleteCourier(
                                        courierId: courierId));
                              }

                              await removeCourier();
                              Navigator.popUntil(
                                  context, (route) => route.isFirst);
                            }),
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: SizedBox(
                      width: 150,
                      child: MaterialButton(
                          highlightElevation: 0,
                          hoverElevation: 0,
                          elevation: 0,
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.1),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Text(AppLocalizations.of(context)!.back),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
