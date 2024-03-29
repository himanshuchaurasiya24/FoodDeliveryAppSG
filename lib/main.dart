import 'package:flutter/material.dart';
import 'package:food_delivery_app_sg/pages/home.dart';
import 'package:food_delivery_app_sg/utils/constants.dart';

// vid at 14:19:13 Shivam Gupta
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Ubuntu',
        primaryColor: primaryColor,
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 40,
          ),
          titleLarge: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          displayMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black38,
          ),
        ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'Ubuntu',
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
          centerTitle: true,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}
