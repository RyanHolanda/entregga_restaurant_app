import 'dart:async';
import 'package:entreggue_restaurant/application/bloc/bloc/app_bloc.dart';
import 'package:entreggue_restaurant/application/presentation/widgets/buttons/add_courier_text_button.dart';
import 'package:entreggue_restaurant/application/presentation/widgets/buttons/sign_out_button.dart';
import 'package:entreggue_restaurant/application/presentation/widgets/dialogs/add_courier_dialog.dart';
import 'package:entreggue_restaurant/application/presentation/widgets/lists/couriers_list_.dart';
import 'package:entreggue_restaurant/application/presentation/widgets/pop_ups/pop_up_menu_mobile.dart';
import 'package:entreggue_restaurant/data/models/store_couriers_model.dart';
import 'package:entreggue_restaurant/data/models/store_id_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

List<StoreCouriers> displayList = [];

class CouriersScreen extends StatefulWidget {
  const CouriersScreen({super.key});

  @override
  State<CouriersScreen> createState() => _CouriersScreenState();
}

class _CouriersScreenState extends State<CouriersScreen> {
  void updateList(String value) {
    return setState(() {
      displayList = storeCouriers
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList()
          .reversed
          .toList();
    });
  }

  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (storeCouriers.isNotEmpty) {
          if (this.mounted) {
            setState(() {
              displayList = storeCouriers.reversed.toList();
            });
          }
          timer.cancel();
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Scaffold(
                floatingActionButton: constraints.maxWidth > 700
                    ? null
                    : FloatingActionButton(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        onPressed: () => AddCourierDialog(context: context)
                            .showAddCourierDialog(),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                appBar: AppBar(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  toolbarHeight: 0,
                  elevation: 0,
                ),
                body: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 20, bottom: 0),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: state.isLoading
                              ? const CircularProgressIndicator()
                              : const SignOutButton(),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            constraints.maxWidth > 700
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${AppLocalizations.of(context)!.storeID} ${storeIdModelString ?? ''}',
                                        style: const TextStyle(
                                          fontSize: 21,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          Clipboard.setData(ClipboardData(
                                              text: storeIdModelString));
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(
                                                      AppLocalizations.of(
                                                              context)!
                                                          .copiedToClipBoard)));
                                        },
                                        icon: const Icon(Icons.copy),
                                        splashRadius: 20,
                                      )
                                    ],
                                  )
                                : const SizedBox.shrink(),
                            constraints.maxWidth > 700
                                ? const SizedBox(
                                    height: 50,
                                  )
                                : const SizedBox.shrink(),
                            Container(
                              decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 15,
                                        color: Theme.of(context)
                                            .primaryColor
                                            .withOpacity(0.05))
                                  ],
                                  borderRadius: BorderRadius.circular(
                                      constraints.maxWidth > 700 ? 30 : 0)),
                              width: constraints.maxWidth > 700
                                  ? 500
                                  : MediaQuery.of(context).size.width,
                              height: constraints.maxWidth > 700
                                  ? MediaQuery.of(context).size.height / 1.5
                                  : MediaQuery.of(context).size.height,
                              child: SafeArea(
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    children: [
                                      constraints.maxWidth < 700
                                          ? Align(
                                              alignment: Alignment.centerLeft,
                                              child: Row(
                                                children: [
                                                  Text(
                                                      '${AppLocalizations.of(context)!.storeID} ${storeIdModelString ?? ''}'),
                                                  IconButton(
                                                      onPressed: () {
                                                        Clipboard.setData(
                                                            ClipboardData(
                                                                text:
                                                                    storeIdModelString));
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(SnackBar(
                                                                content: Text(
                                                                    AppLocalizations.of(
                                                                            context)!
                                                                        .copiedToClipBoard)));
                                                      },
                                                      icon: const Icon(
                                                        Icons.copy,
                                                        size: 18,
                                                      ))
                                                ],
                                              ),
                                            )
                                          : const SizedBox.shrink(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            AppLocalizations.of(context)!
                                                .yourCouriers,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                          constraints.maxWidth > 700
                                              ? const AddCourierTextButton()
                                              : const PopUpMenuMobile()
                                        ],
                                      ),
                                      searchCourierTextField(context),
                                      Expanded(
                                        child: CouriersList(
                                            constraints: constraints,
                                            scrollController: scrollController),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
            ;
          },
        );
      },
    );
  }

  Padding searchCourierTextField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 30),
      child: TextField(
        onChanged: (value) {
          updateList(value);
        },
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            hintText: AppLocalizations.of(context)!.searchCourier,
            filled: true,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(15))),
      ),
    );
  }
}
