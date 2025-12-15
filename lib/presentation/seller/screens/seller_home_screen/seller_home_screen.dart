import 'package:ecommerce_umkm/core/product_provider.dart';
import 'package:ecommerce_umkm/core/user_provider.dart';
import 'package:ecommerce_umkm/models/product.dart';
import 'package:ecommerce_umkm/presentation/seller/screens/seller_detail_product_screen/seller_detail_product.dart';
import 'package:ecommerce_umkm/presentation/seller/screens/home_seller.dart';
import 'package:ecommerce_umkm/utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SellerHomeScreen extends StatelessWidget {

  SellerHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context, listen: true);
    final user = Provider.of<UserProvider>(context, listen: false);
    final List<Product> product = provider.listProduct.where((item) => item.ownerId == user.user!.id).toList();
    print(provider.listProduct.length);
    return Scaffold(
      backgroundColor: bgColor,
      drawer: HomeSeller(),
      appBar: AppBar(
        title: Text("Beranda", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  " Daftar Produk",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800,
                  ),
                ),
                Text(
                  "Stok    ",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800,
                  ),
                ),
              ],
            ),
            ListView.builder(
              itemCount: product.length,
              shrinkWrap: true,
              //physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                var item = product[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              SellerDetailProduct(product: product[index]),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              '$BASE_URL${item.productPhotoPath}',
                              height: 50,
                              width: 50,
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: SizedBox(
                              height: 50,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 50,
                            //color: Colors.green,
                            child: Center(
                              child: Text(
                                item.stock == 0
                                    ? "Habis"
                                    : item.stock.toString(),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  // color: item.stock == 0
                                  //     ? Colors.red:
                                  color: Colors.deepPurple,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
