import 'dart:io';
import 'dart:math';
import 'package:ecommerce_umkm/models/product.dart';
import 'package:ecommerce_umkm/service/api_services.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  final ApiServices api;
  List<Product> _listProduct = [];
  List<Product> _currentListProduct = [];
  bool _loading = false;
  int _currentPage = 1;
  int _totalPage = -1;

  //dengan pencarian produk
  String _query = '';
  List<Product> _searchResults = [];

  List<Product> get listProduct => _listProduct;

  List<Product> get searchResults => _searchResults;

  String get query => _query;

  bool get isLoading => _loading;

  ProductProvider({required this.api}) {
    _initState();
  }

  void _initState() async {
    _currentPage = 1;
    _listProduct = [];
    _currentListProduct = [];
    var res = await api.product.getTotalProduct();
    setPage(_currentPage);
    if (res['status']) {
      _totalPage = res['totalPages'];
    }
  }

  void setPage(int page) async {
    _loading = true;
    notifyListeners();

    _currentPage = page;
    await _getProduct();
    var startIdx = (_currentPage - 1) * 10;
    var tempIdx = startIdx + 10;
    var endIdx = min(tempIdx, _listProduct.length);
    _currentListProduct = listProduct.getRange(startIdx, endIdx).toList();
    _loading = false;
    notifyListeners();
  }

  void nextPage() async {
    _loading = true;
    notifyListeners();
    var tempPage = _currentPage + 1;
    if (tempPage == _totalPage) return;

    _currentPage = tempPage;
    await _getProduct();
    var startIdx = (_currentPage - 1) * 10;
    var tempIdx = startIdx + 10;
    var endIdx = min(tempIdx, _listProduct.length);
    _currentListProduct = listProduct.getRange(startIdx, endIdx).toList();

    _loading = false;
    notifyListeners();
  }

  //mungkin ga dipakai
  void prevPage() {
    if (_currentPage == 1) return;
    _currentPage--;

    notifyListeners();
  }

  void refreshPage() {
    _initState();
  }

  Future<void> _getProduct() async {
    // var result = await api.product.getProductPerPage(_currentPage);
    var result = await api.product.getProductPerPage(_currentPage);
    if (result['status']) {
      var data = result['data'];
      if (data.isEmpty) return;
      print('data masuk');
      if (_listProduct.isEmpty) {
        _listProduct = result['data'];
      } else {
        _listProduct.addAll(result['data']);
      }
    } else {
      return;
    }
  }

  Future<bool> addProduct(String storeId, String name, String price, String desc, File img, String stock) async {
    var result = await api.product.addProduct(storeId, name, price, desc, img, stock);
    return result['status'];
  }
  Future<bool> updateProduct(Product prod, File img) async {
    var result = await api.product.updateProduct(prod, img);
    return result['status'];
  }

  void updateSuggestion(String query) async {
    _query = query;
    var result = await api.product.getProductByName(query);
    _searchResults = result['data'];
    notifyListeners();
  }

  void searchProduct(String searchQuery) async {
    _loading = true;
    notifyListeners();

    var result = await api.product.getProductByName(searchQuery);
    _searchResults = result['data'];

    _loading = false;
    notifyListeners();
  }
}
