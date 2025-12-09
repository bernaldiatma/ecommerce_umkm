import 'dart:convert';
import 'dart:io';
import 'package:ecommerce_umkm/models/product.dart';
import 'package:ecommerce_umkm/utility/constants.dart';
import 'package:http/http.dart' as http;

class ProductServices {
  //ambil semua produk (WARNING)
  Future<Map<String, dynamic>> getAllProduct() async {
    final req = await http.get(Uri.parse('$BASE_URL/api/product/'));
    if (req.statusCode == 200) {
      var result = jsonDecode(req.body) as List<Map<String, dynamic>>;
      List<Product> listProduct = [];
      for (int i = 0; i < result.length; i++) {
        listProduct.add(Product.fromJson(result[i]));
      }
      return {'status': true, 'data': listProduct};
    } else {
      return {'status': false};
    }
  }

  //ambil produk per page (pagination, deskripsi dijelaskan di kode backend)
  Future<Map<String, dynamic>> getProductPerPage(int page) async {
    final req = await http.get(Uri.parse('$BASE_URL/api/product/page/$page'));
    if (req.statusCode == 200) {
      var result = jsonDecode(req.body) as List<Map<String, dynamic>>;
      List<Product> listProduct = [];
      for (int i = 0; i < result.length; i++) {
        listProduct.add(Product.fromJson(result[i]));
      }
      return {'status': true, 'data': listProduct};
    } else {
      return {'status': false};
    }
  }

  //ambil satu produk
  Future<Map<String, dynamic>> getProduct(String id) async {
    final req = await http.get(Uri.parse('$BASE_URL/api/product/id/$id'));
    if (req.statusCode == 200) {
      var result = jsonDecode(req.body) as Map<String, dynamic>;
      var prod = Product.fromJson(result);
      return {'status': true, 'data': prod};
    } else {
      return {'status': false, 'data': 'id not found'};
    }
  }

  //tambah produk
  Future<Map<String, dynamic>> addProduct(String name, String price, String desc, File img) async {
    var req = http.MultipartRequest('POST', Uri.parse('$BASE_URL/api/product/'));
    req.files.add(await http.MultipartFile.fromPath('img', img.path));
    req.fields['name'] = name;
    req.fields['price'] = price;
    req.fields['desc'] = desc;
    var response = await req.send();

    if (response.statusCode == 200) {
      return {'status': true};
    } else {
      return {'status': false};
    }
  }

  //hapus produk
  Future<Map<String, dynamic>> deleteProduct(int id) async {
    final req = await http.delete(Uri.parse('$BASE_URL/api/product/$id'));
    if (req.statusCode == 200) {
      return {'status': true};
    } else {
      return {'status': false};
    }
  }

  //update produk
  Future<Map<String, dynamic>> updateProduct(Product prod) async {
    final req = await http.put(
      Uri.parse('$BASE_URL/api/product/${prod.id}'),
      body: prod.toJson(),
    );

    if (req.statusCode == 200) {
      return {'status': true};
    } else {
      return {'status': false};
    }
  }

  //ambil jumlah produk yang tersedia di db
  Future<Map<String, dynamic>> getTotalProduct() async {
    final req = await http.get(Uri.parse('$BASE_URL/api/product/total'));

    if (req.statusCode == 200) {
      var res = jsonDecode(req.body) as Map<String, dynamic>;
      return {
        'status': true,
        'total': res['data']['totalDocs'],
        'totalPage': res['data']['totalPages'],
      };
    } else {
      return {'status': false};
    }
  }

  //ambil favorit per user
  Future<Map<String, dynamic>> getFavorite(String id) async {
    final req = await http.get(Uri.parse('$BASE_URL/api/product/favorite/id/$id'));
    if (req.statusCode == 200) {
      var result = jsonDecode(req.body) as List<Map<String, dynamic>>;
      List<Product> listProduct = [];
      for (int i = 0; i < result.length; i++) {
        listProduct.add(Product.fromJson(result[i]));
      }
      return {'status': true, 'data': listProduct};
    } else {
      return {'status': false};
    }
  }

  //tambah favorit
  Future<Map<String, dynamic>> addFavorite(String idUser, String idProd) async {
    final req = await http.post(
        Uri.parse('$BASE_URL/api/product/favorite/'),
        body: {"user": idUser, "product": idProd}
    );
    if (req.statusCode == 200) {
      return {'status': true};
    } else {
      return {'status': false};
    }
  }

  //hapus favorit
  Future<Map<String, dynamic>> removeFavorite(String idUser, String idProd) async {
    final req = await http.delete(
        Uri.parse('$BASE_URL/api/product/favorite/'),
        body: {"user": idUser, "product": idProd}
    );
    if (req.statusCode == 200) {
      return {'status': true};
    } else {
      return {'status': false};
    }
  }

  //untuk pencarian
  Future<Map<String, dynamic>> getProductByName(String query) async {
    final req = await http.get(Uri.parse('$BASE_URL/api/get/$query'));
    if (req.statusCode == 200) {
      var result = jsonDecode(req.body) as List<Map<String, dynamic>>;
      List<Product> listProduct = [];
      for (int i = 0; i < result.length; i++) {
        listProduct.add(Product.fromJson(result[i]));
      }
      return {'status': true, 'data': listProduct};
    } else {
      return {'status': false};
    }
  }

  //ambil favorit per user
  Future<Map<String, dynamic>> getCart(String id) async {
    final req = await http.get(Uri.parse('$BASE_URL/api/product/cart/id/$id'));
    if (req.statusCode == 200) {
      var result = jsonDecode(req.body) as List<Map<String, dynamic>>;
      List<Product> listProduct = [];
      for (int i = 0; i < result.length; i++) {
        listProduct.add(Product.fromJson(result[i]));
      }
      return {'status': true, 'data': listProduct};
    } else {
      return {'status': false};
    }
  }

  //tambah favorit
  Future<Map<String, dynamic>> addCart(String idUser, String idProd) async {
    final req = await http.post(
        Uri.parse('$BASE_URL/api/product/cart/'),
        body: {"user": idUser, "product": idProd}
    );
    if (req.statusCode == 200) {
      return {'status': true};
    } else {
      return {'status': false};
    }
  }

  //update favorit
  Future<Map<String, dynamic>> updateCart(String idUser, String idProd, int qty) async {
    final req = await http.post(
        Uri.parse('$BASE_URL/api/product/cart/'),
        body: {"user": idUser, "product": idProd, "qty": qty}
    );
    if (req.statusCode == 200) {
      return {'status': true};
    } else {
      return {'status': false};
    }
  }

  //hapus favorit
  Future<Map<String, dynamic>> removeCart(String idUser, String idProd) async {
    final req = await http.delete(
        Uri.parse('$BASE_URL/api/product/cart/'),
        body: {"user": idUser, "product": idProd}
    );
    if (req.statusCode == 200) {
      return {'status': true};
    } else {
      return {'status': false};
    }
  }
}
