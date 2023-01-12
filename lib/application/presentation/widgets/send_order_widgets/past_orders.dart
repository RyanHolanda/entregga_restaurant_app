import 'package:entreggue_restaurant/application/bloc/bloc/app_bloc.dart';
import 'package:entreggue_restaurant/data/models/adresses_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PasOrdersFromCourier extends StatelessWidget {
  PasOrdersFromCourier({super.key});
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Column(
          children: [
            Text(
              AppLocalizations.of(context)!.sentAddresses,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor.withOpacity(0.3),
                  fontSize: 18),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Scrollbar(
                  thumbVisibility: true,
                  controller: scrollController,
                  child: ListView.builder(
                    shrinkWrap: true,
                    controller: scrollController,
                    itemCount: courierAddresses.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SelectionArea(
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Container(
                            decoration: BoxDecoration(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                boxShadow: [
                                  BoxShadow(
                                      spreadRadius: 1,
                                      blurRadius: 7,
                                      color: Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.05))
                                ],
                                borderRadius: BorderRadius.circular(15)),
                            padding: const EdgeInsets.all(15),
                            child: ListTile(
                                title: Text(
                                  courierAddresses[index].clientName,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      courierAddresses[index].address,
                                    ),
                                    courierAddresses[index].complement == ' '
                                        ? const SizedBox.shrink()
                                        : Text(
                                            courierAddresses[index].complement,
                                          ),
                                    Text(
                                      courierAddresses[index].observations,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                                leading: CircleAvatar(
                                  child: Text(
                                      courierAddresses[index].clientName[0]),
                                )),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
