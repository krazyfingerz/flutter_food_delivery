import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../sharedcomponents/changelanguage.dart';
import '../sharedcomponents/input.dart';
import 'homepage/homepageview.dart';

class LogInView extends StatefulWidget {
  const LogInView({super.key});
  static const routeName = '/login';

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
  final _signinFormKey = GlobalKey<FormState>();
  late String email;
  late String password;
  late AssetImage background;
  String error = "";

  @override
  void initState() {
    super.initState();
    background = const AssetImage("assets/images/intro/gif.gif");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(background, context);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _signinFormKey,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: background,
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: LayoutBuilder(
              builder: ((context, constraint) {
                double h = constraint.maxHeight < 330
                    ? constraint.maxHeight - 50
                    : 220;
                double w = constraint.maxWidth < constraint.maxHeight
                    ? constraint.maxWidth * 0.8
                    : constraint.maxWidth * 0.6;
                return SizedBox(
                  height: constraint.maxHeight,
                  width: constraint.maxWidth,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: h,
                        width: w,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          color: Colors.white60,
                        ),
                        child: ListView(
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.all(10),
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const [
                                ChangeLanguage(),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Input(
                              isemail: true,
                              color: const Color.fromARGB(255, 17, 0, 255),
                              prefixicon: Icons.email,
                              label: AppLocalizations.of(context)!.email,
                              onchanged: (val) {
                                setState(() {
                                  email = val;
                                });
                              },
                            ),
                            Center(
                              child: Text(
                                error,
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            InkWell(
                              child: Container(
                                height: 50.0,
                                decoration: BoxDecoration(
                                  gradient: RadialGradient(colors: [
                                    Colors.red[800] ?? Colors.white,
                                    Colors.white
                                  ], radius: 5),
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.login,
                                        color: Colors.white),
                                    const SizedBox(width: 5),
                                    FittedBox(
                                      fit: BoxFit.fitWidth,
                                      child: Text(
                                        AppLocalizations.of(context)!
                                            .signinregister,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {
                                if (_signinFormKey.currentState!.validate()) {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(builder: (context) {
                                    return const HomepageView();
                                  }));
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
