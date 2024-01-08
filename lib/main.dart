import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/constants/app_routs.dart';
import 'package:black_market/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // تحديد حجم التصميم الأصلي للتطبيق
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Black Market',
          theme: ThemeData(
            fontFamily: 'Almarai',
            useMaterial3: true,
            canvasColor: AppColors.gray,
          ),
          initialRoute: "/splash",
          getPages: approuts,
        );
      },
    );
  }
}
