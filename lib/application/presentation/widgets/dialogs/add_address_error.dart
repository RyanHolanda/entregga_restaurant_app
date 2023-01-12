import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddAddressErrorDialog {
  AddAddressErrorDialog({required this.context});
  BuildContext context;
  showAddressErrorDialog() {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) => Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          height: 200,
          width: 200,
          child: Center(
            child: Column(
              children: [
                Text(
                  AppLocalizations.of(context)!.emptyInputs,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.red,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  AppLocalizations.of(context)!.emptyInputsDescriptions,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
