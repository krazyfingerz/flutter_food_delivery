import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'tabs/homepage.dart';
import 'tabs/profile/nouser/intro.dart';

class App extends StatefulWidget {
  const App({
    Key? key,
  }) : super(key: key);
  static void reboot(BuildContext context) {
    context.findAncestorStateOfType<_AppState>()!.reboot();
  }

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App>{
  Key key = UniqueKey();
  void reboot() {
    setState(() {
      key = UniqueKey();
    });
  }
  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The AnimatedBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return KeyedSubtree(
      key: key,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
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
        onGenerateTitle: (BuildContext context) => AppLocalizations.of(context)!.appTitle,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
        ),
        home: const Intro(),
        // onGenerateRoute: (RouteSettings routeSettings) {
        //   return MaterialPageRoute<void>(
        //     settings: routeSettings,
        //     builder: (BuildContext context) {
        //       switch (routeSettings.name) {
        //         case SettingsView.routeName:
        //           return SettingsView(controller: settingsController);
        //         case SampleItemDetailsView.routeName:
        //           return const SampleItemDetailsView();
        //         case SampleItemListView.routeName:
        //         default:
        //           return const SampleItemListView();
        //       }
        //     },
        //   );
        // },
      ),
    );
  }
}
