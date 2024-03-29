import 'package:flutter/material.dart';

import 'cartcard.dart';
import 'cartdetails.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: demoCarts.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Dismissible(
          key: Key(demoCarts[index].product.id.toString()),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            setState(() {
              demoCarts.removeAt(index);
            });
          },
          background: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: const Color(0xFFFFE6E6),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: const [
                Spacer(),
                Icon(Icons.delete),
              ],
            ),
          ),
          child: CartCard(cart: demoCarts[index]),
        ),
      ),
    );
  }
}
