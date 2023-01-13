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
                                color: courierAddresses[index].completed
                                    ? Theme.of(context)
                                        .colorScheme
                                        .primary
                                        .withOpacity(0.1)
                                    : Theme.of(context).scaffoldBackgroundColor,
                                boxShadow: [
                                  BoxShadow(
                                      spreadRadius: 1,
                                      blurRadius: 7,
                                      color: courierAddresses[index].completed
                                          ? Colors.transparent
                                          : Theme.of(context)
                                              .primaryColor
                                              .withOpacity(0.05))
                                ],
                                borderRadius: BorderRadius.circular(15)),
                            padding: const EdgeInsets.all(15),
                            child: ListTile(
                                trailing: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      courierAddresses[index].date,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Icon(
                                      courierAddresses[index].completed
                                          ? Icons.check
                                          : null,
                                      color: Colors.green,
                                    )
                                  ],
                                ),
                                title: Text(
                                  courierAddresses[index].clientName,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      courierAddresses[index].address,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    courierAddresses[index].complement == ' '
                                        ? const SizedBox.shrink()
                                        : Text(
                                            courierAddresses[index].complement,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
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
