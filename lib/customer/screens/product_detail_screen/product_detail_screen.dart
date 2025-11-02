import 'package:ecommerce_umkm/customer/models/product.dart';
import 'package:ecommerce_umkm/customer/screens/product_detail_screen/components/favorite_button.dart';
import 'package:ecommerce_umkm/customer/screens/product_detail_screen/components/variant_product_selector.dart';
import 'package:ecommerce_umkm/utility/constants.dart';
import 'package:ecommerce_umkm/utility/currency_format.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({Key, key, required this.product})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(backgroundColor: bgColor),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    product.imageProduct,
                    height: 332,
                    width: double.infinity,
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          CurrencyFormat.convertToIdr(product.price, 2),
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: const FavoriteButton(),
                      ),
                    ],
                  ),

                  // TODO: Kalau mau improvisasi ada harga diskon
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 20),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     children: [
                  //       Text(
                  //         CurrencyFormat.convertToIdr(product.offerPrice != 0 ? product.offerPrice : product.price, 2),
                  //         style: TextStyle(
                  //           fontSize: 24,
                  //           fontWeight: FontWeight.bold,
                  //           color: product.offerPrice != 0? Colors.deepPurple : Colors.black,
                  //         ),
                  //       ),
                  //       const SizedBox(width: 8),
                  //       Visibility(
                  //         visible: product.offerPrice != 0,
                  //         child: Text(
                  //           CurrencyFormat.convertToIdr(product.price, 2),
                  //           style: const TextStyle(
                  //             fontSize: 14,
                  //             fontWeight: FontWeight.bold,
                  //             decoration: TextDecoration.lineThrough,
                  //             color: Colors.grey,
                  //           ),
                  //           overflow: TextOverflow.ellipsis,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      product.name,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  // TODO: Kalau mau improvisasi ada varian productnya
                  // const SizedBox(height: 20),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 20),
                  //   child: Text(
                  //     'Varian Tersedia',
                  //     style: TextStyle(
                  //       fontSize: 16,
                  //       fontWeight: FontWeight.bold,
                  //       color: Colors.black,
                  //     ),
                  //   ),
                  // ),
                  // VariantProductSelector(product: product),
                  SizedBox(height: 10),
                  Divider(thickness: 5, color: Colors.grey.shade300),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      bottom: 120,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Deskripsi produk",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 10),
                        ReadMoreText(
                          product.description,
                          style: TextStyle(fontSize: 20, color: Colors.black),
                          trimLines: 5,
                          trimMode: TrimMode.Line,
                          colorClickableText: Colors.deepPurple,
                          trimCollapsedText: "Baca Selengkapnya",
                          trimExpandedText: " Sembunyikan",
                        ),
                      ],
                    ),
                  ),
                  //SizedBox(height: 100),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: double.infinity,
                height: 90,
                color: Colors.white,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                    ),
                    onPressed: () {
                      // TODO: Tambahkan lojik tambahkan keranjang
                    },
                    child: const Text(
                      "Tambahkan ke keranjang",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
