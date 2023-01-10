import 'package:bloc/bloc.dart';
import 'package:entreggue_restaurant/domain/auth/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthStateLoggedOut(isLoading: false)) {
    on<AuthEventLogin>((event, emit) async {
      emit(const AuthStateLoggedOut(isLoading: true));
      try {
        await Auth().signInWithEmailAndPassword(
            email: event.email, password: event.password);
        emit(const AuthStateLoggedIn(isLoading: false));
      } on FirebaseAuthException catch (e) {
        authError = e.code;
        emit(const AuthStateError(isLoading: false));
      }
    });
  }
}

String? authError;
String? authErrorDescription;
