import 'package:flutter/material.dart';
import 'package:time_line_app/page/auth/login_screen.dart';
import 'package:time_line_app/page/auth/register_screen.dart';
import 'package:time_line_app/style/dimens.dart';
import 'package:time_line_app/widget/commons/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';

import '';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body:  SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(Dimens.size16),
              child: SingleChildScrollView(
                child:Padding(
                  padding: const EdgeInsets.symmetric(vertical: Dimens.size16),
                  child:  Column(
                    children: [
                      const SizedBox(width: Dimens.size32,),
                      Text(
                        tr('intro_welcome'),
                        style: theme.textTheme.headline2,
                      ),
                      const SizedBox(
                        height: Dimens.size16,
                      ),
                      Text(
                        tr('title_intro'),
                        style: theme.textTheme.headline5,
                      ),
                      const SizedBox(
                        height: Dimens.size16,
                      ),
                      Image.asset(
                        'assets/image/logo.png',
                        height: Dimens.size300,
                        width: Dimens.size300,
                      ),
                      const SizedBox(
                        height: Dimens.size16,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(
                          Dimens.size16,
                        ),
                        child: CustomButton(
                          text: tr('button_intro_login'),
                          colors: theme.primaryColor,
                          width: size.width,
                          onclick: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Dimens.size16,
                        ),
                        child: CustomButtonRichText(
                          colors: theme.colorScheme.background,
                          colorBorder: theme.colorScheme.onBackground,
                          text: '',
                          width: size.width,
                          richText: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: tr('no_account_yet'), style: theme.textTheme.button!.copyWith(color: theme.primaryColor)),
                              TextSpan(
                                  text: tr('rich_text_intro_sign_up'),
                                  style: theme.textTheme.headline5!
                                      .copyWith(fontWeight: FontWeight.bold)),
                            ]),
                          ),
                          onclick: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const RegisterScreen()));
                          },
                        ),
                      ),
                    ],
                  ),
                )
              )
            )),);
  }
}
