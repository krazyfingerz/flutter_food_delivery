import 'package:flutter/foundation.dart';

/// Mix-in [DiagnosticableTreeMixin] to have access to [debugFillProperties] for the devtool
class AuthState with ChangeNotifier, DiagnosticableTreeMixin {
  final bool _user = false;

  bool get user => _user;

  void login() {
    !_user;
    notifyListeners();
  }

  /// Makes `AuthState` readable inside the devtools by listing all of its properties
  // @override
  // void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  //   super.debugFillProperties(properties);
  //   properties.add(IntProperty('count', count));
  // }
}
