// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'app_bloc.dart';

@immutable
abstract class AppEvent {}

class AppEventLogin extends AppEvent {
  final String email;
  final String password;
  AppEventLogin({
    required this.email,
    required this.password,
  });
}

class AppEventLogOut extends AppEvent {}

class AppEventGetData extends AppEvent {}

class AppEventAddCourier extends AppEvent {
  final String courierName;
  AppEventAddCourier({required this.courierName});
}

class AppEventAddAddressToCourier extends AppEvent {
  final String clientName;
  final String courierId;
  final Map<String, dynamic> dataToAdd;
  AppEventAddAddressToCourier(
      {required this.clientName,
      required this.courierId,
      required this.dataToAdd});
}

class AppEventDeleteCourier extends AppEvent {
  final String courierId;
  AppEventDeleteCourier({required this.courierId});
}

class AppEventGetAddressByCourier extends AppEvent {
  final String courierId;
  AppEventGetAddressByCourier({required this.courierId});
}
