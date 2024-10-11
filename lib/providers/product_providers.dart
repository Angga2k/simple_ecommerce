import 'package:flutter/material.dart';
import 'package:simple_ecommerce/models/product_model.dart';
import 'package:simple_ecommerce/services/product_service.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> _products = [];

  List<ProductModel> get products => _products;

  set products(List<ProductModel> products) {
    _products = products;
    notifyListeners();
  }

  Future<void> getProducts() async {
    List<ProductModel> products = await ProductService().getProducts();
    // Cetak daftar produk di konsol
    for (var product in _products) {
      print('Product Name: ${product.name}, Price: ${product.price}');
    }
    _products = products;
  }
}
