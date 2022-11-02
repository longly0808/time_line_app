import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:time_line_app/dependencies.dart';
import 'package:time_line_app/page/auth/login_screen.dart';
import 'package:time_line_app/services/service.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:  const FirebaseOptions(
    apiKey: "XXX",
    appId: "XXX",
    messagingSenderId: "XXX",
    projectId: "XXX",
  )
  );
  await AppDependencies.initial();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final GmailFirebase gmail = AppDependencies.injector.get<GmailFirebase>();
  final account  =AppDependencies.injector.get<AccountFirebase>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
    );
  }
}

