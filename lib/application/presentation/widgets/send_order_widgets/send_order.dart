import 'package:entreggue_restaurant/application/bloc/bloc/app_bloc.dart';
import 'package:entreggue_restaurant/application/presentation/widgets/dialogs/add_address_error.dart';
import 'package:entreggue_restaurant/domain/text_controllers/text_controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SendAddressWidget extends StatelessWidget {
  const SendAddressWidget({
    Key? key,
    required this.constraints,
    required this.couriernName,
    required this.courierId,
  }) : super(key: key);

  final String couriernName;
  final String courierId;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: constraints.minWidth > 700 ? 500 : 300,
            child: TextField(
              controller: TextControllers.addressController,
              decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.address),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            width: constraints.minWidth > 700 ? 500 : 300,
            child: TextField(
                controller: TextControllers.complementController,
                decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.complement)),
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            width: constraints.minWidth > 700 ? 500 : 300,
            child: TextField(
              controller: TextControllers.clientNameController,
              decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.clientName),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            width: constraints.minWidth > 700 ? 500 : 300,
            child: TextField(
              controller: TextControllers.observationsController,
              decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.observations),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              height: 60,
              width: 300,
              child: MaterialButton(
                onPressed: () async {
                  if (TextControllers.addressController.text.isEmpty ||
                      TextControllers.clientNameController.text.isEmpty) {
                    AddAddressErrorDialog(context: context)
                        .showAddressErrorDialog();
                  } else {
                    context.read<AppBloc>().add(AppEventAddAddressToCourier(
                            clientName:
                                TextControllers.clientNameController.text,
                            courierId: courierId,
                            dataToAdd: {
                              'observations': TextControllers
                                      .observationsController.text.isEmpty
                                  ? ' '
                                  : TextControllers.observationsController.text,
                              'address': TextControllers.addressController.text,
                              'client_name':
                                  TextControllers.clientNameController.text,
                              'complement': TextControllers
                                      .complementController.text.isEmpty
                                  ? ' '
                                  : TextControllers.complementController.text
                            }));
                    TextControllers.addressController.clear();
                    TextControllers.clientNameController.clear();
                    TextControllers.complementController.clear();
                    TextControllers.observationsController.clear();
                  }
                },
                color: Colors.green,
                child: Text(AppLocalizations.of(context)!.sendAddress),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
