import 'package:flutter/material.dart';

class Cart {
  Cart({required this.product, required this.numOfItem});
  final Product product;
  final int numOfItem;
}

List<Cart> demoCarts = [
  Cart(product: demoProducts[0], numOfItem: 2),
  Cart(product: demoProducts[1], numOfItem: 1),
  Cart(product: demoProducts[2], numOfItem: 1),
];

class Product {
  Product({
    required this.id,
    required this.images,
    required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
  });
  
  final int id;
  final String title;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  final bool isFavourite, isPopular;
}


List<Product> demoProducts = [
  Product(
    id: 1,
    images: [
      "assets/images/cart/cart_order_1.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Fish & Chips",
    price: 64.99,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 2,
    images: [
      "assets/images/cart/cart_order_2.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Steak",
    price: 50.5,
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    id: 3,
    images: [
      "assets/images/cart/cart_order_3.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Pasta",
    price: 36.55,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
];