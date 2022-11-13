import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../style/style.dart';
import '../../widget/commons/custom_textfield.dart';
import '../../widget/widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState>_keyForm = GlobalKey();
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
                          'Create new \nAccount',
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
                          hintText: tr('hint_text_username'),
                          isTypePassword: false,
                          onChange: (value) {},
                        ),
                        const SizedBox(
                          height: Dimens.size16,
                        ),
                        CustomTextField(
                          hintText: tr('hint_text_email'),
                          isTypePassword: false,
                          onChange: (value) {},
                        ),
                        const SizedBox(
                          height: Dimens.size16,
                        ),
                        CustomTextField(
                          hintText: tr('hint_text_create_password'),
                          isTypePassword: true,
                        ),
                        const SizedBox(
                          height: Dimens.size16,
                        ),
                        CustomTextField(
                          hintText: tr('hint_text_confirm_password'),
                          isTypePassword: true,
                        ),
                        const SizedBox(
                          height: Dimens.size16,
                        ),
                        const SizedBox(
                          height: Dimens.size16,
                        ),
                        Padding(padding: const EdgeInsets.symmetric(horizontal: Dimens.size16,),
                          child:  CustomButton(
                              width: size.width,
                              borderRadius: Dimens.size16,
                              onclick: () {},
                              text: tr('text_button_register'),
                              colors: theme.primaryColor),),
                        const SizedBox(
                          height: Dimens.size16,
                        ),
                      ],
                    ),
                  )
                ))));
  }
}
