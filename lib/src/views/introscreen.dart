import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen(
      {Key? key,
      required this.c1,
      required this.c2,
      required this.w1,
      required this.w2,
      required this.w3})
      : super(key: key);
  final Color c1;
  final Color c2;
  final Widget w1;
  final Widget w2;
  final Widget w3;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        gradient: LinearGradient(colors: [c1, c2]),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                w1,
                w2,
                w3,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
