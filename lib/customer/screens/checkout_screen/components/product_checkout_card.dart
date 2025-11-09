import 'package:ecommerce_umkm/customer/models/product.dart';
import 'package:ecommerce_umkm/utility/currency_format.dart';
import 'package:flutter/material.dart';

class ProductCheckOutCard extends StatefulWidget {
  final Product product;

  const ProductCheckOutCard({Key? key, required this.product})
    : super(key: key);

  @override
  State<ProductCheckOutCard> createState() => _ProductCheckOutCardState();
}

class _ProductCheckOutCardState extends State<ProductCheckOutCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(
                widget.product.imageProduct,
                height: 80,
                width: 80,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: SizedBox(
                height: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.product.name,
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: [
                        Text(
                          CurrencyFormat.convertToIdr(widget.product.price, 2),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.cyan,
                          ),
                        ),
                        Text(
                          " x ${widget.product.quantity.toString()}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
