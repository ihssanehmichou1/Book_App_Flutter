import 'package:book_grocer/common/color_extenstion.dart';
import 'package:book_grocer/view/account/account_view.dart';
import 'package:book_grocer/view/card/cart_manager.dart';
import 'package:book_grocer/view/main_tab/main_tab_view.dart';
import 'package:book_grocer/view/onboarding/onboarding_view.dart';
import 'package:book_grocer/view/wishlist/wishlist_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => WishlistManager()),
        ChangeNotifierProvider(create: (context) => CartManager()),
      ],
      child: const MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EBook Grocer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: TColor.primary,
        fontFamily: 'SF Pro Text',
      ),
      home: OnboardingView(),
      // home: MainTabView(),
      // home: AccountView(),
    );
  }
}