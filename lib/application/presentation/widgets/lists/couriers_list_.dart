import 'package:entreggue_restaurant/application/bloc/bloc/app_bloc.dart';
import 'package:entreggue_restaurant/application/presentation/views/couriers_screen/couriers_screen.dart';
import 'package:entreggue_restaurant/application/presentation/views/send_order_screen/send_order_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:page_transition/page_transition.dart';

class CouriersList extends StatelessWidget {
  const CouriersList({
    Key? key,
    required this.constraints,
    required this.scrollController,
  }) : super(key: key);

  final ScrollController scrollController;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thumbVisibility: true,
      controller: scrollController,
      child: ListView.builder(
        padding: const EdgeInsets.only(bottom: 20),
        controller: scrollController,
        shrinkWrap: true,
        itemCount: displayList.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                ),
                child: MaterialButton(
                  onPressed: () async {
                    Future goToScreen() async {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: SendOrderScreen(
                                  courierId: displayList[index].id,
                                  couriernName: displayList[index].name),
                              type: PageTransitionType.fade));
                    }

                    await goToScreen();
                    context.read<AppBloc>().add(AppEventGetAddressByCourier(
                        courierId: displayList[index].id));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        CircleAvatar(
                          child: Text(displayList[index].name[0]),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          width: constraints.maxWidth > 700 ? 100 : 70,
                          child: Text(
                            displayList[index].name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const Spacer(),
                        Text(constraints.maxWidth > 700
                            ? 'ID: ${displayList[index].id}'
                            : 'ID: ${displayList[index].id.substring(0, 3)}...'),
                        IconButton(
                            splashRadius: 20,
                            onPressed: () {
                              Clipboard.setData(
                                  ClipboardData(text: displayList[index].id));
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          AppLocalizations.of(context)!
                                              .copiedToClipBoard)));
                            },
                            icon: const Icon(Icons.copy))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
