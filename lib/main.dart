import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logiology/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
   // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    debugShowCheckedModeBanner: false,
    initialRoute: AppRoutes.login,
    getPages: AppRoutes.pages,
      
    );
  }
}

