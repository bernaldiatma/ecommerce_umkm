import 'package:ecommerce_umkm/customer/models/product.dart';
import 'package:ecommerce_umkm/customer/screens/cart_screen/components/cart_card.dart';
import 'package:ecommerce_umkm/customer/screens/cart_screen/provider/cart_provider.dart';
import 'package:ecommerce_umkm/customer/screens/checkout_screen/checkout_screen.dart';
import 'package:ecommerce_umkm/utility/constants.dart';
import 'package:ecommerce_umkm/utility/currency_format.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = CartProvider.of(context);
    final finalList = cartProvider.cart;

    // _buildProductQuantity(IconData icon, int index) {
    //   return GestureDetector(
    //     onTap: () {
    //       setState(() {
    //         icon == Icons.add
    //             ? cartProvider.incrementQuantity(index)
    //             : cartProvider.decrementQuantity(index);
    //       });
    //     },
    //     child: Container(
    //       decoration: BoxDecoration(
    //         shape: BoxShape.circle,
    //         color: Colors.red.shade100,
    //       ),
    //       child: Icon(icon, size: 20),
    //     ),
    //   );
    // }

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text(
          "Keranjang",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade700,
          ),
        ),
        backgroundColor: bgColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: finalList.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                Product product = finalList[index];
                return CartCard(product: product, index: index);
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
            alignment: Alignment.center,
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  CurrencyFormat.convertToIdr(cartProvider.getTotalPrice(), 2),
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.cyan,
                  ),
                ),
                Container(
                  width: 110,
                  height: 44,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      if (cartProvider.cart.isEmpty) {
                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Center(
                              child: Text(
                                "Keranjang masih kosong",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            duration: Duration(seconds: 1),
                            backgroundColor: Colors.red,
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 120,
                            ),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CheckOutScreen(),
                          ),
                        );
                      }
                    },
                    child: Text(
                      "Beli",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
