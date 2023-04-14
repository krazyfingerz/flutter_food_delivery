import 'package:flutter/material.dart';

import '../app.dart';

class ChangeLanguage extends StatelessWidget {
  const ChangeLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      padding: const EdgeInsets.all(4),
      itemBuilder: (context) {
        return [
          const PopupMenuItem(
            value: Locale("en", ""),
            child: Text("English", style: TextStyle(fontSize: 11)),
          ),
          const PopupMenuItem(
            value: Locale("de", ""),
            child: Text("Deutsche", style: TextStyle(fontSize: 11)),
          ),
          const PopupMenuItem(
            value: Locale("fr", ""),
            child: Text("Française", style: TextStyle(fontSize: 11)),
          ),
          const PopupMenuItem(
            value: Locale("pt", ""),
            child: Text("Português", style: TextStyle(fontSize: 11)),
          ),
        ];
      },
      onSelected: (value) async {
        // Prefs().setLocale(value);
        App.reboot(context);
      },
      child: const Icon(Icons.language, size: 24, color: Colors.black),
    );
  }
}
