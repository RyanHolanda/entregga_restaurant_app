// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

@immutable
abstract class AuthState {
  final bool isLoading;
  const AuthState({
    required this.isLoading,
  });
}

class AuthStateLoggedOut extends AuthState {
  const AuthStateLoggedOut({required super.isLoading});
}

class AuthStateLoggedIn extends AuthState {
  const AuthStateLoggedIn({required super.isLoading});
}

class AuthStateError extends AuthState {
  const AuthStateError({required super.isLoading});
}
