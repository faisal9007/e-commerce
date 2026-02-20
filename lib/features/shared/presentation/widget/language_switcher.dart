import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/provider/localization_provider.dart';

class Language_Switcher extends StatelessWidget {
  const Language_Switcher({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<LocalizationProvider>(
        builder: (context, localizationProvider, _) {
          return DropdownMenu<Locale>(
            initialSelection: localizationProvider.locale,
            dropdownMenuEntries: localizationProvider.supportedLocales.map((l){
              return DropdownMenuEntry<Locale>(value: l, label: l.languageCode.toUpperCase());
            }).toList(),
            onSelected: (Locale? selectedLocale){
              localizationProvider.chanheLocale(selectedLocale!);
            },
          );
        }
    );
  }
}