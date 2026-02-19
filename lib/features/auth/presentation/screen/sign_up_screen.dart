import 'package:e_commerce/app/extensions/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/provider/localization_provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String name = '/sign-up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final localizationProvider = context.read<LocalizationProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.signUp),
      ),
      body: Column(
        children: [
          DropdownMenu<Locale>(dropdownMenuEntries: localizationProvider.supportedLocales.map((l){
            return DropdownMenuEntry(value: l, label: l.languageCode.toUpperCase());
          }).toList(),
          onSelected: (Locale? selectedLocale){
            localizationProvider.chanheLocale(selectedLocale!);
          },
          ),
        ],
      ),
    );
  }
}
