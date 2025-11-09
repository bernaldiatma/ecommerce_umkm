import 'package:ecommerce_umkm/customer/models/product.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  final List<Product> _allProducts = [
    Product(
      name: "Vasvit - Sepatu Kulit Pria aaaa aaaa aaaa aaaa aaaa aaaa",
      variant: ["Hitam","Cokelat"],
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      price: 100000,
      offerPrice: 0,
      imageProduct: "assets/images/sepatu_kulit.jpg",
      quantity: 1,
      storeName: "Fasvit Official Store",
    ),
    Product(
      name: "Vasvit - Sepatu Kulit Pria",
      variant: ["Hitam","Cokelat"],
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      price: 100000,
      offerPrice: 80000,
      imageProduct: "assets/images/sepatu_kulit.jpg",
      quantity: 1,
      storeName: "Fasvit Official Store",
    ),
    Product(
      name: "Vasvit - Sepatu Kulit Pria",
      variant: ["Hitam","Cokelat"],
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      price: 200000000,
      offerPrice: 180000000,
      imageProduct: "assets/images/sepatu_kulit.jpg",
      quantity: 1,
      storeName: "Fasvit Official Store",
    ),
    Product(
      name: "Vasvit - Sepatu Kulit Pria",
      variant: ["Hitam","Cokelat"],
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      price: 100000,
      offerPrice: 80000,
      imageProduct: "assets/images/sepatu_kulit.jpg",
      quantity: 1,
      storeName: "Samari Shoes Store",
    ),
    Product(
      name: "Vasvit - Sepatu Kulit Pria",
      variant: ["Hitam","Cokelat"],
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      price: 100000,
      offerPrice: 80000,
      imageProduct: "assets/images/sepatu_kulit.jpg",
      quantity: 1,
      storeName: "Samari Shoes Store",
    ),
    Product(
      name: "Vasvit - Sepatu Kulit Pria",
      variant: ["Hitam","Cokelat"],
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      price: 100000,
      offerPrice: 80000,
      imageProduct: "assets/images/sepatu_kulit.jpg",
      quantity: 1,
      storeName: "Samari Shoes Store",
    ),
  ];

  List<Product> get allProducts => _allProducts;
}