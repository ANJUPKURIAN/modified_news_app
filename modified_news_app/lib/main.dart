import 'package:modified_news_app/controller/favorite_screen_controller.dart';
import 'package:modified_news_app/controller/home_screen_controller.dart';
import 'package:modified_news_app/view/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => HomeScreenController()),
      ChangeNotifierProvider(create: (context) => FavoriteScreenController())
    ], child: MaterialApp(home: SplashScreen()));
  }
}
