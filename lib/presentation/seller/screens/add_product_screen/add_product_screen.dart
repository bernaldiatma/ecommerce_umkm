import 'dart:io';

import 'package:ecommerce_umkm/core/product_provider.dart';
import 'package:ecommerce_umkm/core/user_provider.dart';
import 'package:ecommerce_umkm/presentation/seller/screens/home_seller.dart';
import 'package:ecommerce_umkm/presentation/seller/screens/seller_home_screen/seller_home_screen.dart';
import 'package:ecommerce_umkm/utility/constants.dart';
import 'package:ecommerce_umkm/utility/image_picker_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  File? _image;

  Future<void> _selectImage() async {
    final image = await ImagePickerUtil.pickFromGallery();

    if (image != null) {
      setState(() => _image = image);
    }
  }

  @override
  Widget build(BuildContext context) {
    String nama = '';
    String harga = '';
    String stok = '';
    String deskripsi = '';
    final user = Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: bgColor,
      drawer: HomeSeller(),
      appBar: AppBar(
        title: Text("Tambah Produk", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey, width: 2),
                      color: Colors.grey.shade300,
                    ),
                    child: _image == null
                        ? Center(child: Icon(Icons.image, size: 100, color: Colors.grey.shade500))
                        : Image.file(_image!, fit: BoxFit.cover),
                  ),
                ],
              ),
              SizedBox(height: 14),
              //Tombol tambahkan foto
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 200,
                    child: ElevatedButton.icon(
                      label: Text(
                        "Tambahkah Gambar",
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: () {
                        _selectImage();
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              // Insert nama produk
              Text(
                "Nama Produk",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              SizedBox(height: 4),
              SizedBox(
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  minLines: 1,
                  maxLines: 8,
                  decoration: InputDecoration(
                    hintText: "Ketik nama produk...",
                    hintStyle: TextStyle(color: Colors.grey.shade400, fontWeight: FontWeight.bold),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onChanged: (value) => nama = value,
                ),
              ),
              SizedBox(height: 12),
              // Insert harga produk
              Text(
                "Harga",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              SizedBox(height: 4),
              SizedBox(
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  minLines: 1,
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: "Ketik harga produk...",
                    hintStyle: TextStyle(color: Colors.grey.shade400, fontWeight: FontWeight.bold),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onChanged: (value) => harga = value,
                ),
              ),
              SizedBox(height: 12),
              // insert stok produk
              Text(
                "Stok",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              SizedBox(height: 4),
              SizedBox(
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  minLines: 1,
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: "Ketik stok produk...",
                    hintStyle: TextStyle(color: Colors.grey.shade400, fontWeight: FontWeight.bold),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onChanged: (value) => stok = value,
                ),
              ),
              SizedBox(height: 12),
              // insert deskripsi produk
              Text(
                "Deskripsi",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              SizedBox(height: 4),
              SizedBox(
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  minLines: 2,
                  maxLines: 10,
                  decoration: InputDecoration(
                    hintText: "Ketik deskripsi produk...",
                    hintStyle: TextStyle(color: Colors.grey.shade400, fontWeight: FontWeight.bold),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onChanged: (value) => deskripsi = value,
                  keyboardType: TextInputType.multiline,
                ),
              ),
              SizedBox(height: 40),
              // Submit button
              SizedBox(
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
                    if (nama.isEmpty || harga.isEmpty || stok.isEmpty || deskripsi.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Center(
                            child: Text(
                              'Isi data terlebih dahulu',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          backgroundColor: Colors.yellow,
                          behavior: SnackBarBehavior.floating,
                          margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                        ),
                      );
                      return;
                    }
                    if (_image != null) {
                      var result = await provider.addProduct(user.user!.id, nama, harga, deskripsi, _image!, stok);
                      if (result) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Center(
                              child: Text(
                                'Produk berhasil ditambahkan',
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
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => SellerHomeScreen()),
                        );
                      }
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
