import 'package:entreggue_restaurant/application/presentation/widgets/dialogs/add_courier_dialog.dart';
import 'package:entreggue_restaurant/application/presentation/widgets/dialogs/sign_out_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PopUpMenuMobile extends StatelessWidget {
  const PopUpMenuMobile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (value) {
        value == 'signout'
            ? SignOutDialog(context: context).showSignOutDialog()
            : AddCourierDialog(context: context).showAddCourierDialog();
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
              value: 'addCourier',
              child: Text(AppLocalizations.of(context)!.addCourier)),
          PopupMenuItem(
            enabled: true,
            value: 'signout',
            child: Text(
              AppLocalizations.of(context)!.signOut,
              style: const TextStyle(color: Colors.red),
            ),
          )
        ];
      },
    );
  }
}
