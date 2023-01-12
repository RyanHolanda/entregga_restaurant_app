import 'package:entreggue_restaurant/application/presentation/widgets/dialogs/add_courier_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddCourierTextButton extends StatelessWidget {
  const AddCourierTextButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: () {
          AddCourierDialog(context: context).showAddCourierDialog();
        },
        icon: const Icon(
          Icons.add,
        ),
        label: Text(AppLocalizations.of(context)!.addCourier));
  }
}
