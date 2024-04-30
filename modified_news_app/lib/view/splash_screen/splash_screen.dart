import 'package:flutter/material.dart';
import 'package:modified_news_app/view/splash_screen/home_screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2)).then((value) =>
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.network(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaU4mHuHMDZeVwPuiRtzK6Md6u5tR1VetZTw&s"),
        // child: Text(
        //   "NewsApp",
        //   style: TextStyle(fontSize: 30),
        // ),
      ),
    );
  }
}