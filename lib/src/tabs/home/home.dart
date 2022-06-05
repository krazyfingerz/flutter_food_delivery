import 'package:flutter/material.dart';

import 'topbar.dart';
import 'nearby.dart';
import 'specialoffers.dart';

class Home extends StatelessWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          TopBar(),
          Nearby(),
          SpecialOffers(),
        ],
      ),
    );
  }
}