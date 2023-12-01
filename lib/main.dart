import 'package:black_market/app/core/constants/app_routs.dart';
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
        useMaterial3: true,
      ),
      //  locale: const Locale("en"),
      debugShowCheckedModeBanner: false,
      initialRoute: "/splash",
      getPages: approuts,
    );
  }
}
