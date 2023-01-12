import 'package:entreggue_restaurant/application/bloc/bloc/app_bloc.dart';
import 'package:entreggue_restaurant/application/presentation/widgets/buttons/button_1.dart';
import 'package:entreggue_restaurant/application/presentation/widgets/inputs/input_credentials_field.dart';
import 'package:entreggue_restaurant/domain/text_controllers/text_controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WebLoginScreen extends StatelessWidget {
  const WebLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Scaffold(
          body: SelectionArea(
            child: Row(
              children: [
                Expanded(
                    child: Stack(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Image.asset(
                        'assets/login_image.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Center(
                        child: Text(
                      AppLocalizations.of(context)!.yourDeliveryMadeSimple,
                      style: const TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ))
                  ],
                )),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Padding(
                    padding: const EdgeInsets.all(50),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/logo.png',
                                height: 50,
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              const Text(
                                'Entregga',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Text(
                          AppLocalizations.of(context)!.login,
                          style: const TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          AppLocalizations.of(context)!
                              .insertYourCredentialsToLogin,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.4)),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        InputField(
                          onSubmited: null,
                          controller: TextControllers.emailController,
                          hintText: AppLocalizations.of(context)!.email,
                          isPassword: false,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        InputField(
                          onSubmited: (value) => context.read<AppBloc>().add(
                              AppEventLogin(
                                  email: TextControllers.emailController.text,
                                  password:
                                      TextControllers.passwordController.text)),
                          controller: TextControllers.passwordController,
                          hintText: AppLocalizations.of(context)!.password,
                          isPassword: true,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        state.isLoading
                            ? const CircularProgressIndicator()
                            : MyButton1(
                                onPressed: () {
                                  context.read<AppBloc>().add(AppEventLogin(
                                      email:
                                          TextControllers.emailController.text,
                                      password: TextControllers
                                          .passwordController.text));
                                },
                                title: AppLocalizations.of(context)!.login,
                              ),
                        const Spacer(),
                        Text(
                          'Entregga',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.3)),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
