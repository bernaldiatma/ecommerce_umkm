import 'package:ecommerce_umkm/models/product.dart';
import 'package:ecommerce_umkm/utility/currency_format.dart';
import 'package:flutter/material.dart';

class EditProductPrice extends StatefulWidget {
  final Product product;

  const EditProductPrice({Key? key, required this.product}) : super(key: key);

  @override
  State<EditProductPrice> createState() => _EditProductPriceState();
}

class _EditProductPriceState extends State<EditProductPrice> {
  String harga = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Harga",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              TextButton.icon(
                icon: Icon(Icons.edit, size: 12),
                label: Text(
                  "Edit",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Colors.white,
                        title: Center(
                          child: Text(
                            "Edit Harga",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              child: TextFormField(
                                initialValue: widget.product.price.toString(),
                                style: TextStyle(color: Colors.black),
                                minLines: 1,
                                maxLines: 2,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                onChanged: (value) => harga = value,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            SizedBox(height: 10),
                            SizedBox(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.deepPurple,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                child: Text(
                                  "Simpan",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    widget.product.price = double.parse(harga);
                                  });
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            CurrencyFormat.convertToIdr(widget.product.price, 2),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade700,
            ),
          ),
        ),
      ],
    );
  }
}