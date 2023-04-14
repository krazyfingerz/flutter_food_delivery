import 'package:flutter/material.dart';

import 'shared/nearby.dart';
import 'shared/specialoffers.dart';
import 'shared/topbar.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

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
