// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'app_bloc.dart';

@immutable
abstract class AppState {
  final bool isLoading;
  const AppState({
    required this.isLoading,
  });
}

class AppStateLoggedOut extends AppState {
  const AppStateLoggedOut({required super.isLoading});
}

class AppStateLoggedIn extends AppState {
  const AppStateLoggedIn({required super.isLoading});
}

class AppStateError extends AppState {
  const AppStateError({required super.isLoading});
}
