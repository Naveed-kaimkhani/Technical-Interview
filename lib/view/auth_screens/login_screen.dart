

import 'package:flutter/material.dart';
import 'package:technical_interview/component/curved_login_card.dart';
import 'package:technical_interview/constant/app_images.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.backgroundImage),
            fit: BoxFit.cover,
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
                      child: CurvedLoginCard(),
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
