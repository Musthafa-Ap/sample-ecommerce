import 'package:flutter/material.dart';

import 'product_model.dart';

class ProductsProvider extends ChangeNotifier{
    List<ProductModel> productsList = [
    ProductModel(
      id: 1,
      name: '21WN',
      image: 'assets/images/product1.png',
      description: 'reversible angora cardigan',
      price: 120,
    ),

    ProductModel(
      id: 2,
      name: '21SS',
      image: 'assets/images/product2.png',
      description: 'cotton casual shirt',
      price: 80,
    ),
    ProductModel(
      id: 3,
      name: '21FW',
      image: 'assets/images/product3.png',
      description: 'leather boots',
      price: 150,
    ),
    ProductModel(
      id: 4,
      name: '22SP',
      image: 'assets/images/product4.png',
      description: 'denim jeans',
      price: 90,
    ),
    ProductModel(
      id: 5,
      name: '22SS',
      image: 'assets/images/product1.png',
      description: 'cotton casual shirt',
      price: 80,
    ),
    ProductModel(
      id: 6,
      name: '22FW',
      image: 'assets/images/product2.png',
      description: 'leather boots',
      price: 150,
    ),
    ProductModel(
      id: 7,
      name: '23SP',
      image: 'assets/images/product3.png',
      description: 'denim jeans',
      price: 90,
    ),
    ProductModel(
      id: 8,
      name: '23SS',
      image: 'assets/images/product4.png',
      description: 'cotton casual shirt',
      price: 80,
    ),
    ProductModel(
      id: 9,
      name: '23FW',
      image: 'assets/images/product1.png',
      description: 'leather boots',
      price: 150,
    ),
  ];

}