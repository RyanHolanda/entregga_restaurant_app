import 'package:bloc/bloc.dart';
import 'package:entreggue_restaurant/application/presentation/views/couriers_screen/couriers_screen.dart';
import 'package:entreggue_restaurant/data/models/adresses_model.dart';
import 'package:entreggue_restaurant/data/models/store_couriers_model.dart';
import 'package:entreggue_restaurant/data/repos/firebase_store.dart';
import 'package:entreggue_restaurant/domain/auth/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppStateLoggedOut(isLoading: false)) {
    on<AppEventLogin>((event, emit) async {
      emit(const AppStateLoggedOut(isLoading: true));
      try {
        await Auth().signInWithEmailAndPassword(
            email: event.email, password: event.password);
        add(AppEventGetData());
      } on FirebaseAuthException catch (e) {
        authError = e.code;
        emit(const AppStateError(isLoading: false));
      }
    });
    on<AppEventGetData>((event, emit) async {
      emit(const AppStateLoggedIn(isLoading: true));
      displayList = [];
      await FetchFromStorage().fetchStoreIdFromStorage();
      final couriers = await FetchFromStorage().getAllCouriers();
      storeCouriers = couriers;
      displayList = storeCouriers.reversed.toList();
      emit(const AppStateLoggedIn(isLoading: false));
    });
    on<AppEventLogOut>((event, emit) async {
      await Auth().signOut();
      emit(const AppStateLoggedOut(isLoading: false));
    });
    on<AppEventAddCourier>((event, emit) async {
      emit(const AppStateLoggedIn(isLoading: true));
      await AddToStorage().addCourierToStorage(event.courierName);
      final couriers = await FetchFromStorage().getAllCouriers();
      storeCouriers = couriers;
      displayList = storeCouriers.reversed.toList();
      emit(const AppStateLoggedIn(isLoading: false));
    });
    on<AppEventDeleteCourier>((event, emit) async {
      emit(const AppStateLoggedIn(isLoading: true));
      await RemoveFromStorage().removeCourierFromStorage(event.courierId);
      final couriers = await FetchFromStorage().getAllCouriers();
      storeCouriers = couriers;
      displayList = storeCouriers.reversed.toList();
      emit(const AppStateLoggedIn(isLoading: false));
    });

    on<AppEventAddAddressToCourier>((event, emit) async {
      emit(const AppStateLoggedIn(isLoading: true));
      await AddToStorage().addAdressToCourier(
          event.courierId, event.clientName, event.dataToAdd);
      final addresses =
          await FetchFromStorage().getAdressesByCourier(event.courierId);
      courierAddresses = addresses;
      emit(const AppStateLoggedIn(isLoading: false));
    });

    on<AppEventGetAddressByCourier>((event, emit) async {
      courierAddresses = [];
      emit(const AppStateLoggedIn(isLoading: true));
      final addresses =
          await FetchFromStorage().getAdressesByCourier(event.courierId);
      courierAddresses = addresses;
      emit(const AppStateLoggedIn(isLoading: false));
    });
  }
}

String? authError;
String? authErrorDescription;
