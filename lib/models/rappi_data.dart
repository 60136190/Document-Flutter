import 'package:flutter/cupertino.dart';

class RappiCategory {
  const RappiCategory({
    @required this.name,
    @required this.products,
  });
  final String? name;
  final List<RappiProduct>? products;
}

class RappiProduct {
  const RappiProduct({
    @required this.name,
    @required this.description,
    @required this.price,
    @required this.imgae,
  });
  final String? name;
  final String? description;
  final double? price;
  final String? imgae;
}

const rappiCategories = [
  RappiCategory(name: "ok", products: [
    RappiProduct(
        name: 'Double cheese',
        description: 'very delicious',
        price: 20.0,
        imgae: 'images/auth/rua.png'),
    RappiProduct(
        name: 'Double cheese',
        description: 'very delicious',
        price: 20.0,
        imgae: 'images/auth/rua.png'),
    RappiProduct(
        name: 'Double cheese',
        description: 'very delicious',
        price: 20.0,
        imgae: 'images/auth/rua.png'),
    RappiProduct(
        name: 'Double cheese',
        description: 'very delicious',
        price: 20.0,
        imgae: 'images/auth/rua.png'),
    RappiProduct(
        name: 'Double cheese',
        description: 'very delicious',
        price: 20.0,
        imgae: 'images/auth/rua.png'),
  ]),
  RappiCategory(name: "ok", products: [
    RappiProduct(
        name: 'Double cheese',
        description: 'very delicious',
        price: 20.0,
        imgae: 'images/auth/rua.png'),
    RappiProduct(
        name: 'Double cheese',
        description: 'very delicious',
        price: 20.0,
        imgae: 'images/auth/rua.png'),
    RappiProduct(
        name: 'Double cheese',
        description: 'very delicious',
        price: 20.0,
        imgae: 'images/auth/rua.png'),
    RappiProduct(
        name: 'Double cheese',
        description: 'very delicious',
        price: 20.0,
        imgae: 'images/auth/rua.png'),
    RappiProduct(
        name: 'Double cheese',
        description: 'very delicious',
        price: 20.0,
        imgae: 'images/auth/rua.png'),
  ]),
  RappiCategory(name: "ok", products: [
    RappiProduct(
        name: 'Double cheese',
        description: 'very delicious',
        price: 20.0,
        imgae: 'images/auth/rua.png'),
    RappiProduct(
        name: 'Double cheese',
        description: 'very delicious',
        price: 20.0,
        imgae: 'images/auth/rua.png'),
    RappiProduct(
        name: 'Double cheese',
        description: 'very delicious',
        price: 20.0,
        imgae: 'images/auth/rua.png'),
    RappiProduct(
        name: 'Double cheese',
        description: 'very delicious',
        price: 20.0,
        imgae: 'images/auth/rua.png'),
    RappiProduct(
        name: 'Double cheese',
        description: 'very delicious',
        price: 20.0,
        imgae: 'images/auth/rua.png'),
  ]),
];
