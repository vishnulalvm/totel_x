import 'package:flutter/material.dart';
import 'package:totel_x/presentation/screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor:const Color.fromRGBO(16, 14, 9, 1),),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromRGBO(16, 14, 9, 1), // Set the AppBar background color
          foregroundColor: Colors.white, // Set the AppBar text and icon color
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color.fromRGBO(16, 14, 9, 1), // Set the FloatingActionButton background color
          foregroundColor: Colors.white, // Set the FloatingActionButton icon color
        ),
        useMaterial3: true,
        
      ),
      home: const HomeScreen(),
    );
  }
}

