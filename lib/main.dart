import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logiology/controllers/profile_controller.dart';
import 'package:logiology/routes/app_routes.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init(); // Initialize GetStorage
  Get.put(ProfileController()); 
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

