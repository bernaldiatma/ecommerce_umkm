import 'package:ecommerce_umkm/utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_umkm/widget/custom_search_bar.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ecommerce_umkm/widget/app_bar_action_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(140);

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
                GestureDetector(
                  onTap: () {
                    // TODO: Arahkan ke halaman notifikasi
                  },
                  child: CircleAvatar(
                    radius: 26,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.notifications_none_outlined,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
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
                Expanded(
                  child: CustomSearchBar(
                    controller: TextEditingController(),
                    onChanged: (val) {
                      //TODO: Buat filterProduct dulu
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
