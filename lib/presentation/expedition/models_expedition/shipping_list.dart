import 'package:ecommerce_umkm/presentation/seller/models-sel/seller_product.dart';

class ShippingList {
  String name;
  String productName;
  String status;
  double price;
  String imageProduct;
  int qty;

  ShippingList({
    required this.name,
    required this.productName,
    required this.status,
    required this.price,
    required this.imageProduct,
    required this.qty,
  });
}

final List<ShippingList> ShippingProductList = [
  ShippingList(
    name: "Rusdianto",
    productName: "Vasvit - Sepatu Kulit Pria aaaa aaaa aaaa aaaa aaaa",
    status: "Sudah Terkirim",
    price: 200000,
    imageProduct: "assets/images/sepatu_kulit.jpg",
    qty: 2,
  ),
  ShippingList(
    name: "Bagus Adi",
    productName: "Vasvit - Sepatu Kulit Pria",
    status: "Dalam Perjalanan",
    price: 200000,
    imageProduct: "assets/images/sepatu_kulit.jpg",
    qty: 2,
  ),
  ShippingList(
    name: "Mas Ambarawa",
    productName: "Vasvit - Sepatu Kulit Pria",
    status: "Sudah terkirim",
    price: 200000,
    imageProduct: "assets/images/sepatu_kulit.jpg",
    qty: 2,
  ),
  ShippingList(
    name: "Mas Ambatron",
    productName: "Vasvit - Sepatu Kulit Pria",
    status: "Sudah terkirim",
    price: 200000,
    imageProduct: "assets/images/sepatu_kulit.jpg",
    qty: 2,
  ),
  ShippingList(
    name: "Mas Ambatublow",
    productName: "Vasvit - Sepatu Kulit Pria",
    status: "Dalam Perjalanan",
    price: 200000,
    imageProduct: "assets/images/sepatu_kulit.jpg",
    qty: 2,
  ),
  ShippingList(
    name: "Mas Rusdi",
    productName: "Vasvit - Sepatu Kulit Pria",
    status: "Sudah terkirim",
    price: 200000,
    imageProduct: "assets/images/sepatu_kulit.jpg",
    qty: 2,
  ),
];