import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_interview/constant/app_images.dart';
import 'package:technical_interview/data/models/user_model.dart';
import 'package:technical_interview/view_model/login_controller.dart';

class UserDetailsCard extends StatelessWidget {
  UserDetailsCard({super.key});

  final LoginController _loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    UserModel? user = _loginController.loggedInUser.value;
    final size = MediaQuery.of(context).size;
    return Positioned(
      top: size.height * 0.05,
      left: size.width * 0.04,
      right: size.width * 0.04,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                AppImages.profile,
                width: size.width * 0.15, // Responsive image size
              ),
              SizedBox(width: size.width * 0.04), // Responsive spacing
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * 0.02),

                  // User ID
                  Text(
                    user!.id,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: size.width * 0.035,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  // SizedBox(height: size.height * 0.01),

                  // User Name
                  Text(
                    user.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: size.width * 0.05,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // SizedBox(height: size.height * 0.01),

                  // Email
                  Text(
                    user.email,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: size.width * 0.035,
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),

                  // Divider
                  Container(
                    width: size.width * 0.5, // Responsive width
                    height: 1,
                    color: Colors.white24,
                  ),

                  SizedBox(height: size.height * 0.01),
                ],
              ),
            ],
          ),

          SizedBox(height: size.height * 0.001),
          Divider(color: Colors.white),

          Row(
            children: [
              Text(
                "Company: ",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: size.width * 0.035,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                user.company,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: size.width * 0.035,
                ),
              ),
            ],
          ),

          // Platform
          Row(
            children: [
              Text(
                "Platform: ",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: size.width * 0.035,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                user.platform,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: size.width * 0.035,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
