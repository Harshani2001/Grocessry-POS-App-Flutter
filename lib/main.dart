import 'package:flutter/material.dart';
import 'package:mpos/auth/ui/sign_in_page.dart';
import 'package:mpos/features/home/ui/home.dart';
import 'package:mpos/auth/ui/sign_up_page.dart';
import 'package:mpos/auth/ui/welcomscreen.dart';
import 'features/cart/bloc/cart_bloc.dart';
import 'features/wishlist/bloc/wishlist_bloc.dart';

void main() {
  final cartBloc = CartBloc();
  final wishlistBloc = WishlistBloc(cartBloc: cartBloc);

  runApp(MyApp(cartBloc: cartBloc, wishlistBloc: wishlistBloc));
}

class MyApp extends StatelessWidget {
  const MyApp(
      {super.key,
      required CartBloc cartBloc,
      required WishlistBloc wishlistBloc});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       theme: ThemeData(
      textTheme: TextTheme(
        bodyLarge: TextStyle(fontSize: 14), // Set default text size for bodyText1
        bodyMedium: TextStyle(fontSize: 12), // Set default text size for bodyText2
        titleLarge: TextStyle(fontSize: 14), // Set default text size for headlines
      ),
    ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/signIn': (context) => SignInPage(), // Replace with your SignInPage
        '/signUp': (context) => SignUpPage(), //signup page
        '/home': (context) => Home(), // Replace with your Home screen
      },
    );
  }
}
