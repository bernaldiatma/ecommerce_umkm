import 'dart:ui';
import 'package:ecommerce_umkm/core/data_provider.dart';
import 'package:ecommerce_umkm/customer/models/product_provider.dart';
import 'package:ecommerce_umkm/customer/screens/bottom_nav_bar.dart';
import 'package:ecommerce_umkm/customer/screens/cart_screen/provider/cart_provider.dart';
import 'package:ecommerce_umkm/customer/screens/order_screen/provider/order_provider.dart';
import 'package:ecommerce_umkm/customer/screens/product_favorite_screen/provider/favorite_provider.dart';
import 'package:ecommerce_umkm/input_addr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cart/cart.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  var cart = FlutterCart();
  //TODO: should complete add one signal app id
  OneSignal.initialize("YOUR_ONE_SIGNAL_APP_ID");
  OneSignal.Notifications.requestPermission(true);
  await cart.initializeCart(isPersistenceSupportEnabled: true);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DataProvider()),
        ChangeNotifierProvider(create: (context) => FavoriteProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => OrderProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
        }
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        textTheme: GoogleFonts.urbanistTextTheme(Theme.of(context).textTheme).apply(bodyColor: Colors.white),
      ),
      //home: const LoginScreen(),
      home: const BottomNavBar(),
      //home: const InputAddr(),
    );
  }
}
