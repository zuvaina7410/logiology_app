import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:logiology/screens/home.dart';
import 'package:logiology/screens/login.dart';

class AppRoutes{
  static const login ='/login';
  static const home ='/home';

  static final pages = [
   GetPage(name: login, page: () => LoginPage()),
   GetPage(name: home, page: () => HomePage()),
  ];

}