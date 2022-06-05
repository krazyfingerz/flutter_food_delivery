import 'package:flutter/material.dart';

class Scroller extends StatefulWidget {
  const Scroller({
    Key? key,
    required this.child,
    this.animationDuration = const Duration(milliseconds: 10000),
    this.direction = Axis.horizontal,
    this.backDuration = const Duration(milliseconds: 1),
    this.pauseDuration = const Duration(milliseconds: 1),
  }) : super(key: key);
  final Widget child;
  final Axis direction;
  final Duration animationDuration, backDuration, pauseDuration;


  @override
  _ScrollerState createState() => _ScrollerState();
}

class _ScrollerState extends State<Scroller> {
  late ScrollController scrollController;
  @override
  void initState() {
    scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback(scroll);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: widget.child,
      scrollDirection: widget.direction,
      controller: scrollController,
    );
  }

  void scroll(_) async {
    while (scrollController.hasClients) {
      await Future.delayed(widget.pauseDuration);
      if (scrollController.hasClients) {
        await scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration: widget.animationDuration,
            curve: Curves.linear);
      }
      await Future.delayed(widget.pauseDuration);
      if (scrollController.hasClients) {
        await scrollController.animateTo(0.0,
            duration: widget.backDuration, curve: Curves.easeOut);
      }
    }
  }
}