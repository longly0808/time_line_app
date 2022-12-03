import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:time_line_app/model/model.dart';
import 'package:time_line_app/services/firestore_cloud/app_fire_store_cloud.dart';
import 'package:time_line_app/services/service.dart';
import 'package:firebase_auth/firebase_auth.dart';


class GoogleProvider extends AuthWithFirebase {
  AppPreferences _appPreferences;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleProvider(this._appPreferences);
  @override
  Future<User?> register({
    required String name,
    required String email,
    required String password,
  }) async {

    User? user;
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      await user!.updateProfile(displayName: name);
      await user.reload();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    return user;
  }

  @override
  Future<bool> logOut() async {
    await _auth.signOut();
    await _appPreferences.getInstance();
    await _appPreferences.setAuth(false);
    return  await _appPreferences.getAuth();
  }

  @override
  Future<UserCredential> login() async {
    if (kIsWeb) {
      GoogleAuthProvider googleProvider = GoogleAuthProvider();

      googleProvider.addScope('https://www.googleapis.com/auth/contacts.readonly');
      googleProvider.setCustomParameters({
        'login_hint': 'yoeraccount@example.com'
      });
      return await FirebaseAuth.instance.signInWithPopup(googleProvider);

    } else {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential userCredential =  await FirebaseAuth.instance.signInWithCredential(credential);
      UserModel userModel = UserModel()..userName = userCredential.user?.displayName ?? ''
                                        ..urlImage = userCredential.user?.photoURL??'display'
                                        ..mail = userCredential.user?.email
                                        ..phoneNumber = userCredential.user?.phoneNumber
                                        ..id = userCredential.user?.email
                                        ..info = userCredential.user?.uid;
      await AppFireStoreCloud.addNewUser(userModel);
      return await FirebaseAuth.instance.signInWithCredential(credential);
    }

  }


}
