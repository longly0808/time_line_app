import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:time_line_app/app_dependencies.dart';
import 'package:time_line_app/page/auth/register_screen.dart';
import 'package:time_line_app/services/auth/google_auth_provider.dart';
import 'package:time_line_app/style/dimens.dart';
import 'package:time_line_app/widget/commons/custom_button.dart';
import 'package:time_line_app/widget/commons/custom_textfield.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:time_line_app/widget/commons/switch_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _keyForm = GlobalKey();

  @override
  void initState() {
    // FirebaseMessaging firebase_mess = FirebaseMessaging.instance;
    // firebase_mess.getToken( ).then((value) {
    //   print('token $value');
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(Dimens.size16),
                child: Form(
                  key: _keyForm,
                  child:SingleChildScrollView(
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: Dimens.size16,
                        ),
                        InkWell(
                          child: Icon(
                            Icons.arrow_back_outlined,
                            color: theme.primaryColorDark,
                            size: Dimens.size32,
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        const SizedBox(
                          height: Dimens.size16,
                        ),
                        Text(
                          'Welcome \nback!',
                          style: theme.textTheme.headline2,
                        ),
                        //logo
                        Image.asset(
                          'assets/image/logo.png',
                          height: Dimens.size150,
                          width: Dimens.size150,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              tr('remember_me'),
                              style: theme.textTheme.bodyText1,
                            ),
                            const Spacer(),
                            SwitchButton(
                              isShowStatus: false,
                              onChanged: (value) {},
                            )
                          ],
                        ),
                        const SizedBox(
                          height: Dimens.size16,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: Dimens.size16,
                          ),
                          child: CustomButton(
                              width: size.width,
                              borderRadius: Dimens.size16,
                              onclick: () async {
                                final GoogleSignInAccount? googleUser = await GoogleSignIn().signOut();
                                googleUser?.clearAuthCache();
                                print('google account out!!');

                              },
                              text: tr('text_button_login'),
                              colors: theme.primaryColor),
                        ),
                        const SizedBox(
                          height: Dimens.size16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              tr('text_forgot_password'),
                              style: theme.textTheme.bodyText2,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                    const RegisterScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                tr('text_sign_up'),
                                style: theme.textTheme.headline5!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),),

                          ],
                        ),
                        const SizedBox(height: Dimens.size16,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'or use account google',
                              style: theme.textTheme.bodyText2,
                            ),
                            const SizedBox(width: Dimens.size16,),
                            InkWell(
                              onTap: () async{
                                final google =AppDependencies().injector.get<GoogleProvider>();

                                // FirebaseAuth auth  = FirebaseAuth.instance;
                                await google.login();


                              },
                              child: Container(
                                width: Dimens.size40,
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(Dimens.size16),
                                    border: Border.all(color: theme.primaryColor,width:2,)
                                ),
                                child: Image.asset('assets/image/icon_google.png',
                                    width: Dimens.size32, color: theme.primaryColor,),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ))));
  }
}
