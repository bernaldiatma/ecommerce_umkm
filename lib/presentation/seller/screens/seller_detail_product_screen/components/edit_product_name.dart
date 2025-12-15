import 'package:ecommerce_umkm/models/product.dart';
import 'package:flutter/material.dart';

class EditProductName extends StatefulWidget {
  Product product;

  EditProductName({Key? key, required this.product}) : super(key: key);

  @override
  State<EditProductName> createState() => _EditProductNameState();
}

class _EditProductNameState extends State<EditProductName> {
  String nama = '';

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
                "Nama Produk",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              TextButton.icon(
                icon: Icon(Icons.edit, size: 12),
                label: Text(
                  "Edit",
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Colors.white,
                        title: Center(
                          child: Text(
                            "Edit Nama Produk",
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
                                initialValue: widget.product.name,
                                style: TextStyle(color: Colors.black),
                                minLines: 1,
                                maxLines: 8,
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
                                onChanged: (value) => nama = value,
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
                                    widget.product.name = nama;
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
            widget.product.name,
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
