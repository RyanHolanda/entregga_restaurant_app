import 'package:entreggue_restaurant/application/presentation/widgets/dialogs/sign_out_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: SizedBox(
        width: 150,
        child: MaterialButton(
          onPressed: () {
            SignOutDialog(context: context).showSignOutDialog();
          },
          color: Colors.red,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Text(AppLocalizations.of(context)!.signOut),
          ),
        ),
      ),
    );
  }
}
