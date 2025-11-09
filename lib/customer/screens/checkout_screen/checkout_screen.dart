import 'package:ecommerce_umkm/customer/models/product.dart';
import 'package:ecommerce_umkm/customer/screens/cart_screen/provider/cart_provider.dart';
import 'package:ecommerce_umkm/customer/screens/checkout_screen/components/bank_transfer_screen.dart';
import 'package:ecommerce_umkm/customer/screens/checkout_screen/components/cod_success_screen.dart';
import 'package:ecommerce_umkm/customer/screens/checkout_screen/components/product_checkout_card.dart';
import 'package:ecommerce_umkm/customer/screens/checkout_screen/components/radio_button_expedition_choice.dart';
import 'package:ecommerce_umkm/customer/screens/checkout_screen/components/radio_button_payment_choice.dart';
import 'package:ecommerce_umkm/utility/constants.dart';
import 'package:ecommerce_umkm/utility/currency_format.dart';
import 'package:flutter/material.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  int _selectedPaymentMethod = 0;
  int _selectedExpedition = 0;

  @override
  Widget build(BuildContext context) {
    final cartProvider = CartProvider.of(context);
    final finalList = cartProvider.cart;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Checkout",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Alamat pengiriman kamu",
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.deepPurple,
                            size: 20,
                          ),
                          SizedBox(width: 6),
                          Expanded(
                            child: SizedBox(
                              child: Text(
                                "Rumah Cantika",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Text(
                        "RT09 RW80, Kelurahan Kelurahan, Kecamatan Kecamatan, Kabupaten Kabupaten",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: finalList.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    Product product = finalList[index];
                    return ProductCheckOutCard(product: product);
                  },
                ),
                SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: Text(
                          "Kurir Ekspedisi",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      RadioButtonExpeditionChoice(
                        groupValue: _selectedExpedition,
                        onChanged: (int? newValue) {
                          setState(() {
                            _selectedExpedition = newValue ?? 0;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: Text(
                          "Metode Pembayaran",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      RadioButtonPaymentChoice(
                        grupValue: _selectedPaymentMethod,
                        onChanged: (int? newValue) {
                          setState(() {
                            _selectedPaymentMethod = newValue ?? 0;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 150),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: double.infinity,
                height: 120,
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.grey.shade200, width: 1.4),
                  ),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Tagihan",
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                        Text(
                          CurrencyFormat.convertToIdr(
                            cartProvider.getTotalPrice(),
                            2,
                          ),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.cyan,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 150,
                      height: 44,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          String paymentMethodString =
                              _selectedPaymentMethod == 0
                              ? "Transfer Bank"
                              : "Cash On Delivery (COD)";

                          String expeditionString;
                          switch (_selectedExpedition) {
                            case 0:
                              expeditionString = "JNE";
                              break;
                            case 1:
                              expeditionString = "JNT";
                              break;
                            case 2:
                              expeditionString = "Si Cepat";
                              break;
                            default:
                              expeditionString = "JNE";
                          }

                          if (_selectedPaymentMethod == 0) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => BankTransferScreen(
                                  paymentMethod: paymentMethodString,
                                  expedition: expeditionString,
                                ),
                              ),
                            );
                          } else if (_selectedPaymentMethod == 1) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => CodSuccessScreen(
                                  paymentMethod: paymentMethodString,
                                  expedition: expeditionString,
                                ),
                              ),
                            );
                          }
                        },
                        child: Text(
                          "Bayar Sekarang",
                          style: TextStyle(
                            fontSize: 14,
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
        ],
      ),
    );
  }
}
