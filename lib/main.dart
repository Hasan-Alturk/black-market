import 'package:black_market/app/core/constants/app_routs.dart';
import 'package:black_market/app/modules/splash/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Black Market',
      theme: ThemeData(
        fontFamily: 'Almarai',
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const SpalshView(),
      getPages: approuts,
    );
  }
}
