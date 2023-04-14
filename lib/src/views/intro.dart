import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'introscreen.dart';
import 'loginview.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});
  static const routeName = '/';

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  int i = 0;
  PageController pc = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        double h = constraints.maxHeight;
        double w = constraints.maxWidth;
        double r = h > w ? (w - 100) / 3 : (h - 100) / 3;
        List<Widget> pages = [
          s1(r),
          s2(r),
          s3(r),
          s4(r),
        ];

        return Stack(
          children: [
            PageView(
              allowImplicitScrolling: true,
              controller: pc,
              physics: const BouncingScrollPhysics(),
              onPageChanged: (newPage) {
                setState(() {
                  i = newPage;
                });
              },
              children: pages,
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        i == 0
                            ? const SizedBox()
                            : GestureDetector(
                                child: const Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.red,
                                  size: 40,
                                ),
                                onTap: () {
                                  pc.previousPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.ease);
                                },
                              ),
                        Center(child: Text("${i + 1}/${pages.length}")),
                        i + 1 == pages.length
                            ? InkWell(
                                child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.red, width: 2),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: const EdgeInsets.all(5),
                                    child: Text(
                                      AppLocalizations.of(context)!.signin,
                                      style: const TextStyle(color: Colors.red),
                                    )),
                                onTap: () {
                                  Navigator.restorablePushNamed(
                                    context,
                                    LogInView.routeName,
                                  );
                                })
                            : GestureDetector(
                                child: const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.red,
                                  size: 40,
                                ),
                                onTap: () {
                                  pc.nextPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.ease);
                                },
                              ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  s1(r) {
    return IntroScreen(
      c1: (Colors.red[900])!,
      c2: (Colors.red[700])!,
      w1: const SizedBox(),
      w2: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: CircleAvatar(
          radius: r,
          backgroundColor: Colors.transparent,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(r),
            child: const Image(
              fit: BoxFit.contain,
              image: AssetImage("assets/images/intro/loading.gif"),
            ),
          ),
        ),
      ),
      w3: Text(
        AppLocalizations.of(context)!.c1,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.red[600], fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  s2(r) {
    return IntroScreen(
      c1: (Colors.red[900])!,
      c2: (Colors.red[700])!,
      w1: Text(
        AppLocalizations.of(context)!.c2,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.red[600], fontSize: 16, fontWeight: FontWeight.bold),
      ),
      w2: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: CircleAvatar(
          radius: r,
          backgroundColor: Colors.transparent,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(r),
            child: const Image(
              fit: BoxFit.contain,
              image: AssetImage("assets/images/intro/s2.jpg"),
            ),
          ),
        ),
      ),
      w3: Text(
        AppLocalizations.of(context)!.c3,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.red[600], fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  s3(r) {
    return IntroScreen(
      c1: (Colors.red[900])!,
      c2: (Colors.red[700])!,
      w1: const SizedBox(),
      w2: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: CircleAvatar(
          radius: r,
          backgroundColor: Colors.transparent,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(r),
            child: const Image(
              fit: BoxFit.contain,
              image: AssetImage("assets/images/intro/s3.jpg"),
            ),
          ),
        ),
      ),
      w3: Text(
        AppLocalizations.of(context)!.c4,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.red[600], fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  s4(r) {
    return IntroScreen(
      c1: (Colors.red[900])!,
      c2: (Colors.red[700])!,
      w1: Text(
        AppLocalizations.of(context)!.c5,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.red[600], fontSize: 16, fontWeight: FontWeight.bold),
      ),
      w2: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: CircleAvatar(
          radius: r,
          backgroundColor: Colors.transparent,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(r),
            child: const Image(
              fit: BoxFit.contain,
              image: AssetImage("assets/images/intro/s4.jpg"),
            ),
          ),
        ),
      ),
      w3: Text(
        AppLocalizations.of(context)!.c6,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.red[600], fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
