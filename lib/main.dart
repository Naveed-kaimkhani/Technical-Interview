import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_interview/routes/app_routes.dart';
import 'package:technical_interview/view/auth_screens/login_screen.dart';

import 'data/auth_repository/index.dart';

void main() {

  serviceLocator();
  runApp(
    MyApp(),
    
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'PublicSans', // Apply font globally
        textTheme: TextTheme(
          bodyMedium: TextStyle(fontFamily: 'PublicSans'),
          bodySmall: TextStyle(fontFamily: 'PublicSans'),
        ),
      ),
      home: LoginScreen(),

      // initialRoute: RouteName.LoginScreen,
      getPages: AppRoutes.getAppRoutes(),
    );
  }

}

  serviceLocator() {
    Get.lazyPut<AuthRepository>(() => MockAuthRepo());
  }
