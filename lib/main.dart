import 'dart:ui';
import 'package:ecommerce_umkm/core/user_provider.dart';
import 'package:ecommerce_umkm/core/product_provider.dart';
import 'package:ecommerce_umkm/core/cart_provider.dart';
import 'package:ecommerce_umkm/core/order_provider.dart';
import 'package:ecommerce_umkm/core/favorite_provider.dart';
import 'package:ecommerce_umkm/presentation/expedition/expedition_screen.dart';
import 'package:ecommerce_umkm/presentation/login_screen/login_screen.dart';
import 'package:ecommerce_umkm/presentation/customer/screens/home_customer.dart';
import 'package:ecommerce_umkm/core/seller_order_provider.dart';
import 'package:ecommerce_umkm/presentation/seller/screens/home_seller.dart';
import 'package:ecommerce_umkm/presentation/splash_screeen/splash_screen.dart';
import 'package:ecommerce_umkm/service/api_services.dart';
import 'package:ecommerce_umkm/service/user_service.dart';
import 'package:ecommerce_umkm/utility/prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cart/cart.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'models/user.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  var cart = FlutterCart();
  await cart.initializeCart(isPersistenceSupportEnabled: true);

  runApp(
    MultiProvider(
      providers: [
        Provider(create: (_) => ApiServices()),
        ChangeNotifierProvider(create: (context) => UserProvider(api: context.read<ApiServices>())),
        ChangeNotifierProvider(create: (context) => FavoriteProvider(api: context.read<ApiServices>())),
        ChangeNotifierProvider(create: (context) => CartProvider(api: context.read<ApiServices>())),
        ChangeNotifierProvider(create: (context) => OrderProvider(api: context.read<ApiServices>())),
        ChangeNotifierProvider(create: (context) => ProductProvider(api: context.read<ApiServices>())),
        ChangeNotifierProvider(create: (context) => OrderProvider(api: context.read<ApiServices>())),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  late final bool loggedIn;
  late final String role;
  MyApp({super.key}) {
    init();
  }

  void init() async {
    loggedIn = await Prefs.checkLogin();
    if (loggedIn) {
      var res = await Prefs.readAuth();
      role = (res['user'] as User).role;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch},
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        textTheme: GoogleFonts.urbanistTextTheme(
          Theme.of(context).textTheme,
        ).apply(bodyColor: Colors.white),
      ),
      home: Consumer<UserProvider>(
        builder: (_, auth, _) {
          return FutureBuilder(future: Future.delayed(Duration(seconds: 5)), builder: (context, snapshot){
            if (loggedIn) {
              if (role == 'penjual') {
                return HomeSeller();
              } else {
                return HomeCustomer();
              }
            }
            //return LoginScreen();
            //return SplashScreen(key);
            return ExpeditionScreen(key);
          });
        },
      ),
    );
  }
}
