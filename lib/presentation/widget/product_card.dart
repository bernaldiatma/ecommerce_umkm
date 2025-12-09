import 'package:ecommerce_umkm/models/product.dart';
import 'package:ecommerce_umkm/utility/currency_format.dart';
import 'package:ecommerce_umkm/utility/constants.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final Product product;

  const ProductCard(Key? key, this.product) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Image.network(
              '$BASE_URL${widget.product.productPhotoPath}',
              height: 190,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
            child: Text(
              widget.product.name,
              style: TextStyle(fontSize: 16, color: Colors.black),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  CurrencyFormat.convertToIdr(widget.product.price, 2),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.cyan,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              widget.product.storeName,
              style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       product.offerPrice != 0
          //           ? Text(
          //               CurrencyFormat.convertToIdr(product.price, 2),
          //               style: TextStyle(
          //                 fontSize: 12,
          //                 fontWeight: FontWeight.bold,
          //                 decoration: TextDecoration.lineThrough,
          //                 color: Colors.grey,
          //               ),
          //             )
          //           : SizedBox.shrink(),
          //       if (product.offerPrice == 0) SizedBox(height: 8),
          //       Text(
          //         CurrencyFormat.convertToIdr(
          //           product.offerPrice != 0
          //               ? product.offerPrice
          //               : product.price,
          //           2,
          //         ),
          //         style: TextStyle(
          //           fontSize: 16,
          //           fontWeight: FontWeight.bold,
          //           color: Colors.black,
          //         ),
          //         overflow: TextOverflow.ellipsis,
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
