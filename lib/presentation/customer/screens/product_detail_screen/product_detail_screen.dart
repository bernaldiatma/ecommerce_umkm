import 'package:ecommerce_umkm/models/product.dart';
import 'package:ecommerce_umkm/core/cart_provider.dart';
import 'package:ecommerce_umkm/presentation/customer/screens/product_detail_screen/components/favorite_button.dart';
import 'package:ecommerce_umkm/presentation/customer/screens/product_detail_screen/components/variant_product_selector.dart';
import 'package:ecommerce_umkm/core/favorite_provider.dart';
import 'package:ecommerce_umkm/presentation/customer/screens/store_screen/store_screen.dart';
import 'package:ecommerce_umkm/utility/constants.dart';
import 'package:ecommerce_umkm/utility/currency_format.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({Key, key, required this.product}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final favoriteProvider = FavoriteProvider.of(context);
    final cartProvider = CartProvider.of(context);

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
                  Image.network(
                    '$BASE_URL$widget.product.productPhotoPath',
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
                          CurrencyFormat.convertToIdr(widget.product.price, 2),
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: GestureDetector(
                          onTap: () {
                            final bool isFavorite = favoriteProvider.isExist(widget.product);

                            final String message = isFavorite
                                ? "Dihapus dari favorit"
                                : "Berhasil ditambahkan ke favorit";

                            ScaffoldMessenger.of(context).clearSnackBars();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Center(
                                  child: Text(
                                    message,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                duration: Duration(seconds: 1),
                                backgroundColor: isFavorite ? Colors.red : Colors.green,
                                behavior: SnackBarBehavior.floating,
                                margin: EdgeInsets.symmetric(horizontal: 24, vertical: 80),
                              ),
                            );

                            favoriteProvider.toggleFavorite(widget.product);
                          },
                          child: Icon(
                            favoriteProvider.isExist(widget.product)
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: favoriteProvider.isExist(widget.product)
                                ? Colors.red
                                : Colors.black,
                          ),
                        ),
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
                      widget.product.name,
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
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => StoreScreen(storeName: widget.product.storeName),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 26,
                              backgroundColor: Colors.grey.shade400,
                              child: Icon(Icons.store_rounded, size: 26),
                            ),
                            SizedBox(width: 12),
                            Icon(Icons.check_box, size: 20, color: Colors.purpleAccent),
                            SizedBox(width: 6),
                            Text(
                              widget.product.storeName,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Divider(thickness: 5, color: Colors.grey.shade300),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, bottom: 120),
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
                          widget.product.desc,
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
                child: Padding(
                  padding: const EdgeInsets.only(right: 30, left: 30, top: 18, bottom: 30),
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () {
                      cartProvider.toggleProduct(widget.product);

                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Center(
                            child: Text(
                              "Berhasil ditambahkan ke keranjang",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          duration: Duration(seconds: 1),
                          backgroundColor: Colors.green,
                          behavior: SnackBarBehavior.floating,
                          margin: EdgeInsets.symmetric(horizontal: 24, vertical: 80),
                        ),
                      );
                    },
                    icon: const Icon(Icons.shopping_cart_outlined, size: 20, color: Colors.white),
                    label: const Text(
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
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.symmetric(
          //         horizontal: 20,
          //         vertical: 30,
          //       ),
          //       child: SizedBox(
          //         width: double.infinity,
          //         child: ElevatedButton.icon(
          //           style: ElevatedButton.styleFrom(
          //             backgroundColor: Colors.deepPurple,
          //           ),
          //           onPressed: () {
          //             cartProvider.toggleProduct(widget.product);
          //           },
          //           icon: const Icon(Icons.shopping_cart_outlined, size: 20, color: Colors.white),
          //           label: const Text(
          //             "Tambahkan ke keranjang",
          //             style: TextStyle(
          //               fontSize: 20,
          //               fontWeight: FontWeight.bold,
          //               color: Colors.white,
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
