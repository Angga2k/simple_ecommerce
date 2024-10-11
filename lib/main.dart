import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_ecommerce/pages/home/main_page.dart';
import 'package:simple_ecommerce/pages/sign_in_page.dart';
import 'package:simple_ecommerce/pages/sign_up_page.dart';
import 'package:simple_ecommerce/pages/splash_page.dart';
import 'package:simple_ecommerce/providers/product_providers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
      ],
      child: MaterialApp(debugShowCheckedModeBanner: false, routes: {
        '/': (context) => SplashPage(),
        '/sign-in': (context) => SignInPage(),
        '/sign-up': (context) => SignUpPage(),
        '/home': (context) => MainPage(),
      }),
    );
  }
}
