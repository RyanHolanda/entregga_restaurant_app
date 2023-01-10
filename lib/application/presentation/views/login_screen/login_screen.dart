// ignore_for_file: use_build_context_synchronously

import 'package:entreggue_restaurant/application/bloc/bloc/auth_bloc.dart';
import 'package:entreggue_restaurant/application/presentation/views/login_screen/mobile.dart';
import 'package:entreggue_restaurant/application/presentation/views/login_screen/web.dart';
import 'package:entreggue_restaurant/application/presentation/widgets/dialogs/error_dialog.dart';
import 'package:entreggue_restaurant/application/presentation/widgets/dialogs/loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) async {
        state.isLoading
            ? LoadingDialog(context: context).showLoadingDialog()
            : state is AuthStateLoggedIn
                ? Navigator.pop(context)
                : null;
        if (state is AuthStateError) {
          Future back() async {
            Navigator.pop(context);
          }

          await back();
          switch (authError) {
            case 'user-not-found':
              authError = AppLocalizations.of(context)!.wrongCredentials;
              authErrorDescription =
                  AppLocalizations.of(context)!.wrongCredentialsDescription;
              break;
            case 'invalid-email':
              authError = AppLocalizations.of(context)!.wrongCredentials;
              authErrorDescription =
                  AppLocalizations.of(context)!.wrongCredentialsDescription;
              break;
            case 'wrong-password':
              authError = AppLocalizations.of(context)!.wrongCredentials;
              authErrorDescription =
                  AppLocalizations.of(context)!.wrongCredentialsDescription;
              break;
            case 'too-many-requests':
              authError = AppLocalizations.of(context)!.wrongCredentials;
              authErrorDescription =
                  AppLocalizations.of(context)!.wrongCredentialsDescription;
              break;
            default:
              authError = AppLocalizations.of(context)!.unknownError;
              authErrorDescription = AppLocalizations.of(context)!.unknownError;
          }

          ErrorDialog(context: context).showErrorDialog();
        }
      },
      child: Scaffold(
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth < 700) {
              return const MobileLoginScreen();
            } else {
              return const WebLoginScreen();
            }
          },
        ),
      ),
    );
  }
}
