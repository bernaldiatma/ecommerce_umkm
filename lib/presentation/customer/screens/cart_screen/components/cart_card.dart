import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ecommerce_umkm/models/cart.dart';
import 'package:ecommerce_umkm/models/product.dart';
import 'package:ecommerce_umkm/core/cart_provider.dart';
import 'package:ecommerce_umkm/presentation/customer/screens/product_detail_screen/product_detail_screen.dart';
import 'package:ecommerce_umkm/utility/constants.dart';
import 'package:ecommerce_umkm/utility/currency_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CartCard extends StatefulWidget {
  final Cart cart;
  final int index;

  const CartCard({Key? key, required this.cart, required this.index})
    : super(key: key);

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = CartProvider.of(context);

    _buildProductQuantity(IconData icon, int index) {
      return GestureDetector(
        onTap: () {
          //setState(() {
            icon == Icons.add
                ? cartProvider.incrementQuantity(index)
                : cartProvider.decrementQuantity(index);
          //});
        },
        child: Icon(icon, size: 18),
      );
    }

    _buildDeleteProductFromCart(IconData icon, int index) {
      return GestureDetector(
        onTap: () {
          cartProvider.deleteFromCart(widget.cart.product);
        },
        child: Icon(icon, fontWeight: FontWeight.bold, size: 18),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          ProductDetailScreen(product: widget.cart.product),
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    '$BASE_URL${widget.cart.product.productPhotoPath}',
                    height: 80,
                    width: 80,
                    fit: BoxFit.fill,
                  ),
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
                        widget.cart.product.name,
                        style: TextStyle(fontSize: 16, color: Colors.black),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            CurrencyFormat.convertToIdr(
                              widget.cart.product.price,
                              2,
                            ),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.cyan,
                            ),
                          ),
                          Container(
                            width: 90,
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.deepPurple,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  widget.cart.qty == 1
                                      ? _buildDeleteProductFromCart(
                                          CupertinoIcons.trash,
                                          widget.index,
                                        )
                                      : _buildProductQuantity(
                                          Icons.remove,
                                          widget.index,
                                        ),
                                  Text(
                                    widget.cart.qty.toString(),
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  _buildProductQuantity(
                                    Icons.add,
                                    widget.index,
                                  ),
                                ],
                              ),
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
      ),
    );
  }
}
