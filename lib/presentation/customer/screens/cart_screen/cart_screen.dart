import 'package:ecommerce_umkm/models/product.dart';
import 'package:ecommerce_umkm/models/cart.dart';
import 'package:ecommerce_umkm/presentation/customer/screens/home_customer.dart';
import 'package:ecommerce_umkm/presentation/customer/screens/cart_screen/components/cart_card.dart';
import 'package:ecommerce_umkm/core/cart_provider.dart';
import 'package:ecommerce_umkm/presentation/customer/screens/checkout_screen/checkout_screen.dart';
import 'package:ecommerce_umkm/utility/constants.dart';
import 'package:ecommerce_umkm/utility/currency_format.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = CartProvider.of(context);

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
      body: Consumer<CartProvider>(
        builder: (_, cartProvider, _) {
          if (cartProvider.cart.isEmpty) {
            return Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/images/empty-cart.png",
                          height: 120,
                          width: 120,
                        ),
                        Expanded(
                          child: SizedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Waduh, keranjang belanjamu kosong",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  maxLines: 2,
                                ),
                                Text(
                                  "Yuk, isi dengan barang belanjamu !",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey.shade700,
                                  ),
                                  maxLines: 2,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        label: Text(
                          "Mulai Belanja",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => HomeCustomer()),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartProvider.cart.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    Cart cart = cartProvider.cart[index];
                    return CartCard(cart: cart, index: index);
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
                      CurrencyFormat.convertToIdr(
                        cartProvider.getTotalPrice(),
                        2,
                      ),
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
          );
        },
      ),

      // Expanded(
      //   child: ListView.builder(
      //     itemCount: finalList.length,
      //     shrinkWrap: true,
      //     scrollDirection: Axis.vertical,
      //     itemBuilder: (context, index) {
      //       Product product = finalList[index];
      //       return CartCard(product: product, index: index);
      //     },
      //   ),
      // ),
    );
  }
}
