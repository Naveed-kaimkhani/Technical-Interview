import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_interview/constant/app_images.dart';

import '../../component/index.dart';

class OtpScreen extends StatelessWidget {
  late final String employeeId;
OtpScreen({super.key}) : employeeId = Get.arguments; // Assign the value here


  @override
  Widget build(BuildContext context) {
    // employeeId = Get.arguments; // Access the passed argument

    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              AppImages.backgroundImage,
            ), // Correctly loading the asset image
            fit: BoxFit.cover, // Ensures the image fills the entire container
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: screenSize.width * 0.6, // 60% of screen width
                  child: Image.asset(AppImages.appLogo, fit: BoxFit.contain),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenSize.width * 0.1,
                  ), // 10% padding
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: 400, // Maximum width for the card
                    ),
                    child: AspectRatio(
                      aspectRatio: 3 / 4, // Maintain aspect ratio if needed
                      child: CurvedOTPCard(employeeId: employeeId),
                    ),
                  ),
                ),

                SizedBox(
                  height: screenSize.height * 0.15,
                ), // 15% of screen height
              ],
            ),
          ),
        ),
      ),
    );
  }
}
