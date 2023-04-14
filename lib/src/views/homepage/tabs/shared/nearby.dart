import 'package:flutter/material.dart';

class Nearby extends StatelessWidget {
  const Nearby({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          "Nearby",
          style: TextStyle(
              fontSize: 20,
              color: Color(0xFF3a3a3b),
              fontWeight: FontWeight.w300),
        ),
        SizedBox(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              MerchantTile(name: "Burger", imageURL: "ic_burger"),
              MerchantTile(name: "Sushi", imageURL: "ic_sushi"),
              MerchantTile(name: "Pizza", imageURL: "ic_pizza"),
              MerchantTile(name: "Cake", imageURL: "ic_cake"),
              MerchantTile(name: "Ice Cream", imageURL: "ic_ice_cream"),
              MerchantTile(name: "Soft Drink", imageURL: "ic_soft_drink"),
              MerchantTile(name: "Burger", imageURL: "ic_burger"),
              MerchantTile(name: "Sushi", imageURL: "ic_sushi"),
            ],
          ),
        ),
      ],
    );
  }
}

class MerchantTile extends StatelessWidget {
  const MerchantTile({Key? key , required this.name , required this.imageURL}) : super(key: key);
  final String name;
  final String imageURL;
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 10, right: 5, top: 5, bottom: 5),
            decoration: const BoxDecoration(boxShadow: [
              BoxShadow(
                color: Color(0xFFfae3e2),
                blurRadius: 25.0,
                offset: Offset(0.0, 0.75),
              ),
            ]),
            child: Card(
                color: Colors.white,
                elevation: 0,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(3.0),
                  ),
                ),
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: Center(
                    child: Image.asset(
                    'assets/images/nearby/' + imageURL + ".png",
                    width: 24,
                    height: 24,
                    ),
                  ),
                )),
          ),
          Text(
            name,
            style: const TextStyle(
              color: Color(0xFF6e6e71),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
      onTap: () {},
    );
  }
}