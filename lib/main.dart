import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:time_line_app/dependencies.dart';
import 'package:time_line_app/helper/localization_helper.dart';
import 'package:time_line_app/page/auth/login_screen.dart';
import 'package:time_line_app/services/service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:time_line_app/style/my_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'name-here',
      options: const FirebaseOptions(
    apiKey: "XXX",
    appId: "XXX",
    messagingSenderId: "XXX",
    projectId: "XXX",
  ));
  await AppDependencies.initial();
  runApp(
    EasyLocalization(
      supportedLocales: LocalizationHelper.listLocale(),
      startLocale: LocalizationHelper.listLocale().first,
      fallbackLocale: LocalizationHelper.listLocale().first,
      path: 'assets/translations',
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final GmailFirebase gmail = AppDependencies.injector.get<GmailFirebase>();
  final account = AppDependencies.injector.get<AccountFirebase>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales:  context.supportedLocales,
      locale: context.locale,
      theme: MyTheme.lightTheme(),
      home: const LoginScreen(),
    );
  }
}
