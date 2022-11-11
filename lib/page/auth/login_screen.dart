import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:time_line_app/page/auth/register_screen.dart';
import 'package:time_line_app/style/dimens.dart';
import 'package:time_line_app/utility/notification_firebase.dart';
import 'package:time_line_app/widget/commons/custom_button.dart';
import 'package:time_line_app/widget/commons/custom_textfield.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _keyForm = GlobalKey();

  @override
  void initState() {
    FirebaseMessaging firebase_mess = FirebaseMessaging.instance;
    firebase_mess.getToken( ).then((value) {
      print('token $value');
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(Dimens.size16),
                child: Form(
                  key: _keyForm,
                  child: Column(
                    children: [
                      //logo
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(Dimens.size16),
                        child: Image.asset(
                          'assets/image/logo.png',
                          height: Dimens.size200,
                          width: Dimens.size200,
                        ),
                      ),
                      //textForm
                      CustomTextField(
                        hintText: tr('hint_text_email'),
                        isTypePassword: false,
                        onChange: (value) {},
                      ),
                      const SizedBox(
                        height: Dimens.size16,
                      ),
                      CustomTextField(
                        hintText: tr('hint_text_password'),
                        isTypePassword: true,
                      ),
                      const SizedBox(
                        height: Dimens.size16,
                      ),
                      CustomButton(
                          onclick: () {


                            // NotificationFirebase.showNotification(
                            //   id: 1,
                            //   title: 'textaaa',
                            //   payload: 'payload ne',
                            //   description: 'gi cung duoc , description nhe',
                            // );
                          },
                          text: tr('text_button_login'),
                          colors: theme.primaryColor),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            tr('text_forgot_password'),
                            style: theme.textTheme.bodyText2,
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> const RegisterScreen(),),);
                              },
                              child: Text(
                                tr('text_sign_up'),
                                style: theme.textTheme.headline5!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ))
                        ],
                      )
                    ],
                  ),
                ))));
  }
}
