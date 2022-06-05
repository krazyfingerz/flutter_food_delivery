import 'package:flutter/material.dart';

import '../app.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      child: const Icon(Icons.language, size: 24, color: Colors.black),
      padding: const EdgeInsets.all(4),
      itemBuilder: (context) {
        return [
          const PopupMenuItem(
            child: Text("English", style: TextStyle(fontSize: 11)),
            value: Locale("en", ""),
          ),
          const PopupMenuItem(
            child: Text("Deutsche", style: TextStyle(fontSize: 11)),
            value: Locale("de", ""),
          ),
          const PopupMenuItem(
            child: Text("Française", style: TextStyle(fontSize: 11)),
            value: Locale("fr", ""),
          ),
          const PopupMenuItem(
            child: Text("Português", style: TextStyle(fontSize: 11)),
            value: Locale("pt", ""),
          ),
        ];
      },
      onSelected: (value) async{
        // await Prefs().setLocale(value);
        App.reboot(context);
      },
    );
  }
}