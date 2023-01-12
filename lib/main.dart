import 'package:entreggue_restaurant/application/bloc/bloc/app_bloc.dart';
import 'package:entreggue_restaurant/application/presentation/views/couriers_screen/couriers_screen.dart';
import 'package:entreggue_restaurant/application/presentation/views/send_order_screen/send_order_screen.dart';
import 'package:entreggue_restaurant/application/presentation/widgets/dialogs/loading_dialog.dart';
import 'package:entreggue_restaurant/domain/auth/auth.dart';
import '../firebase_options.dart';
import 'package:entreggue_restaurant/l10n/l10n.dart';
import 'package:entreggue_restaurant/application/presentation/views/login_screen/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return BlocProvider(
      create: (context) => AppBloc(),
      child: MaterialApp(
          localizationsDelegates: const [
            GlobalWidgetsLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            AppLocalizations.delegate
          ],
          supportedLocales: L10n.all,
          debugShowCheckedModeBanner: false,
          theme: lightTheme(),
          home: BlocListener<AppBloc, AppState>(
            listener: (context, state) {
              if (state is AppStateLoggedIn && state.isLoading == true) {
                LoadingDialog(context: context).showLoadingDialog();
              } else if (state is AppStateLoggedIn &&
                  state.isLoading == false) {
                print('is not loading anymore');
                Navigator.pop(context);
              }
            },
            child: StreamBuilder(
                stream: Auth().authStateChanges,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    context.read<AppBloc>().add(AppEventGetData());
                  }
                  return BlocBuilder<AppBloc, AppState>(
                    builder: (context, state) {
                      if (state is AppStateLoggedIn) {
                        return const CouriersScreen();
                      } else {
                        return const LoginScreen();
                      }
                    },
                  );
                }),
          )),
    );
  }

  ThemeData lightTheme() {
    return ThemeData(
        primaryColor: Colors.black,
        colorScheme: const ColorScheme.light(
            primary: Color.fromARGB(255, 5, 215, 12), secondary: Colors.white));
  }
}
