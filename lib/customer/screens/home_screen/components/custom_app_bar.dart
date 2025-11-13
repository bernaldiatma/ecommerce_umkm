import 'package:ecommerce_umkm/customer/models/product.dart';
import 'package:ecommerce_umkm/customer/screens/cart_screen/cart_screen.dart';
import 'package:ecommerce_umkm/customer/screens/home_screen/components/custom_search_bar.dart';
import 'package:ecommerce_umkm/customer/screens/notification_screen/notification_screen.dart';
import 'package:ecommerce_umkm/utility/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_umkm/widget/old_custom_search_bar.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ecommerce_umkm/widget/app_bar_action_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(130);

  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Halo Cantika",
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => CartScreen()),
                        );
                      },
                      child: CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.shopping_cart_outlined,
                          size: 24,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => NotificationScreen()),
                        );
                      },
                      child: CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.notifications_none_outlined,
                          size: 24,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppBarActionButton(
                  icon: Icons.menu,
                  onPressed: () {
                    final box = GetStorage();
                    Map<String, dynamic>? userJson = box.read(USER_INFO_BOX);
                    //TODO: Nunggu ada model user
                    //User? userLogged = User.fromJson(userJson ?? {});
                    Scaffold.of(context).openDrawer();
                  },
                ),
                // Expanded(
                //   child: CustomSearchBar(
                //     controller: TextEditingController(),
                //     onChanged: (val) {
                //       //TODO: Buat filterProduct dulu
                //     },
                //   ),
                // ),
                Expanded(
                  child: CustomSearchBar(allProducts: ProductList),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
