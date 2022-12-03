import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthProvider {
  Future<UserCredential> login();

  Future<bool> logOut();

  Future<User?> register({
    required String name,
    required String email,
    required String password,
  });
}

abstract class AuthWithFirebase extends AuthProvider {
  @override
  Future<UserCredential> login();

  @override
  Future<bool> logOut();

  @override
  Future<User?> register({
    required String name,
    required String email,
    required String password,
  });
}
