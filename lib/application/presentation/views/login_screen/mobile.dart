import 'package:entreggue_restaurant/application/bloc/bloc/app_bloc.dart';
import 'package:entreggue_restaurant/application/presentation/widgets/buttons/button_1.dart';
import 'package:entreggue_restaurant/application/presentation/widgets/inputs/input_credentials_field.dart';
import 'package:entreggue_restaurant/domain/text_controllers/text_controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MobileLoginScreen extends StatelessWidget {
  const MobileLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              Image.asset(
                'assets/login_image.jpg',
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 200),
                child: Center(
                    child: Text(
                  AppLocalizations.of(context)!.yourDeliveryMadeSimple,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 28),
                )),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    padding:
                        const EdgeInsets.only(left: 50, right: 50, top: 50),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    height: MediaQuery.of(context).size.height / 2,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.login,
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            AppLocalizations.of(context)!
                                .insertYourCredentialsToLogin,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.3)),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          InputField(
                              onSubmited: null,
                              controller: TextControllers.emailController,
                              hintText: AppLocalizations.of(context)!.email,
                              isPassword: false),
                          const SizedBox(
                            height: 20,
                          ),
                          InputField(
                              onSubmited: (value) => context
                                  .read<AppBloc>()
                                  .add(AppEventLogin(
                                      email:
                                          TextControllers.emailController.text,
                                      password: TextControllers
                                          .passwordController.text)),
                              controller: TextControllers.passwordController,
                              hintText: AppLocalizations.of(context)!.password,
                              isPassword: true),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 50),
                            child: state.isLoading
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : MyButton1(
                                    title: AppLocalizations.of(context)!.login,
                                    onPressed: () {
                                      context.read<AppBloc>().add(AppEventLogin(
                                          email: TextControllers
                                              .emailController.text,
                                          password: TextControllers
                                              .passwordController.text));
                                    },
                                  ),
                          )
                        ],
                      ),
                    )),
              )
            ],
          ),
        );
      },
    );
  }
}
