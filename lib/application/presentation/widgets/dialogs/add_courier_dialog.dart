import 'package:entreggue_restaurant/application/bloc/bloc/app_bloc.dart';
import 'package:entreggue_restaurant/domain/text_controllers/text_controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddCourierDialog {
  AddCourierDialog({required this.context});
  BuildContext context;
  showAddCourierDialog() {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) => const AddCourierContainer());
  }
}

class AddCourierContainer extends StatelessWidget {
  const AddCourierContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      children: [
        Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            height: 200,
            width: 300,
            child: Center(
              child: Material(
                child: Column(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.addCourier,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const Spacer(),
                    TextField(
                      controller: TextControllers.courierNameController,
                      decoration: InputDecoration(
                          hintText: AppLocalizations.of(context)!.courierName),
                    ),
                    const Spacer(),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: MaterialButton(
                        color: Theme.of(context).colorScheme.primary,
                        onPressed: () async {
                          Future addCourier() async {
                            context.read<AppBloc>().add(AppEventAddCourier(
                                courierName: TextControllers
                                        .courierNameController.text.isEmpty
                                    ? ' '
                                    : TextControllers
                                        .courierNameController.text));
                          }

                          await addCourier();
                          Navigator.pop(context);
                          TextControllers.courierNameController.clear();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Text(
                            AppLocalizations.of(context)!.add,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
