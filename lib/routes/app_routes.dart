
import 'package:get/get.dart';
import 'package:technical_interview/routes/routes_name.dart';
import 'package:technical_interview/view/auth_screens/login_screen.dart';
import 'package:technical_interview/view/auth_screens/otp_screen.dart';
import 'package:technical_interview/view/profile/profile_screen.dart';



class AppRoutes {
  static getAppRoutes() => [
    GetPage(
        name: RouteName.loginScreen,
        page: () =>  LoginScreen(),
        transition: Transition.cupertino),
             GetPage(
        name: RouteName.otpScreencreen,
        page: () =>  OtpScreen(),
        transition: Transition.cupertino),
          GetPage(
        name: RouteName.userProfile,
        page: () =>  UserProfile(),
        transition: Transition.cupertino),
           
  ];
}

