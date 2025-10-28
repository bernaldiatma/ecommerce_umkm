import 'package:ecommerce_umkm/utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class GoogleNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const GoogleNavBar({Key? key, required this.currentIndex, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 20,
          top: 12,
        ),
        child: GNav(
          backgroundColor: Colors.white,
          color: Colors.black,
          activeColor: primaryColor,
          tabBackgroundColor: secondaryColor,
          padding: EdgeInsets.all(20),
          gap: 8,
          onTabChange: onTap,
          textStyle: GoogleFonts.urbanist(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: primaryColor,
          ),
          tabs: const [
            GButton(icon: Icons.home_outlined, text: "Beranda"),
            GButton(icon: Icons.favorite_outline, text: "Favorit"),
            GButton(icon: Icons.shopping_cart_outlined, text: "Keranjang"),
            GButton(icon: Icons.person_outlined, text: "Profil"),
          ],
        ),
      ),
    );
  }
}
