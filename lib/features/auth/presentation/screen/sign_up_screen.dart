import 'package:e_commerce/app/extensions/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/provider/localization_provider.dart';
import '../../../shared/presentation/widget/language_switcher.dart';
import '../../../shared/presentation/widget/theme_switcher.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String name = '/sign-up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.signUp),
      ),
      body: Column(
        children: [
          Language_Switcher(),
          SizedBox(height: 20,),
          Theme_Switcher(),
        ],
      ),
    );
  }
}


