import 'dart:io';

import 'package:ecommerce_umkm/core/product_provider.dart';
import 'package:ecommerce_umkm/core/user_provider.dart';
import 'package:ecommerce_umkm/models/product.dart';
import 'package:ecommerce_umkm/presentation/seller/screens/seller_detail_product_screen/components/edit_product_description.dart';
import 'package:ecommerce_umkm/presentation/seller/screens/seller_detail_product_screen/components/edit_product_name.dart';
import 'package:ecommerce_umkm/presentation/seller/screens/seller_detail_product_screen/components/edit_product_price.dart';
import 'package:ecommerce_umkm/presentation/seller/screens/seller_detail_product_screen/components/edit_product_stock.dart';
import 'package:ecommerce_umkm/utility/constants.dart';
import 'package:ecommerce_umkm/utility/currency_format.dart';
import 'package:ecommerce_umkm/utility/image_picker_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SellerDetailProduct extends StatefulWidget {
  final Product product;

  const SellerDetailProduct({Key? key, required this.product}) : super(key: key);

  @override
  State<SellerDetailProduct> createState() => _SellerDetailProductState();
}

class _SellerDetailProductState extends State<SellerDetailProduct> {
  File? _image;

  Future<void> _selectImage() async {
    final image = await ImagePickerUtil.pickFromGallery();

    if (image != null) {
      setState(() => _image = image);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text(
          "Detail Produk",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _image == null
                ? Image.network(
                    '$BASE_URL${widget.product.productPhotoPath}',
                    height: 332,
                    width: double.infinity,
                  )
                : Image.file(_image!, height: 332, width: double.infinity),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                  width: 130,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                    ),
                    child: Text(
                      "Edit Gambar",
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    onPressed: () {
                      _selectImage();
                    },
                  ),
                ),
              ],
            ),
            EditProductName(product: widget.product),
            Divider(color: Colors.grey.shade400, thickness: 2, indent: 20, endIndent: 20),
            EditProductPrice(product: widget.product),
            Divider(color: Colors.grey.shade400, thickness: 2, indent: 20, endIndent: 20),
            EditProductStock(product: widget.product),
            Divider(color: Colors.grey.shade400, thickness: 2, indent: 20, endIndent: 20),
            EditProductDescriprion(product: widget.product),
            SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: double.infinity,
                height: 44,
                child: ElevatedButton.icon(
                  label: Text(
                    "Simpan",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () async {
                    final provider = Provider.of<ProductProvider>(context, listen: false);
                    final user = Provider.of<UserProvider>(context, listen: false);
                    print('produk: ${widget.product}');
                    if (_image != null) {
                      var result = await provider.updateProduct(widget.product, _image!);
                      if (result) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Center(
                              child: Text(
                                'Produk berhasil diperbarui',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            backgroundColor: Colors.green,
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                          ),
                        );
                      }
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
