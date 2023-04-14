import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'views/homepage/homepageview.dart';
import 'views/intro.dart';
import 'views/loginview.dart';

class App extends StatefulWidget {
  const App({
    super.key,
  });
  static void reboot(BuildContext context) {
    context.findAncestorStateOfType<_AppState>()!.reboot();
  }

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  Key key = UniqueKey();
  void reboot() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      restorationScopeId: 'app',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
      ],
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) {
            switch (routeSettings.name) {
              case LogInView.routeName:
                return const LogInView();
              case HomepageView.routeName:
                return const HomepageView();
              case Intro.routeName:
              default:
                return const Intro();
            }
          },
        );
      },
    );
  }
}
