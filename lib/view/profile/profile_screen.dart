import 'package:flutter/material.dart';
import 'package:technical_interview/component/index.dart';
import 'package:technical_interview/constant/app_images.dart';

class UserProfile extends StatelessWidget {
  final List<String> profileImages = ['assets/png/home_header.png'];


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: _buildMainView(size),
          ), // Ensures content fits properly
        ],
      ),
    );
  }

  Widget _buildMainView(Size size) {
    return SizedBox(
      height: size.height,
      child: Stack(
        children: [
          _buildBackgroundImage(size),
          UserDetailsCard(),
          _buildKeyFunctions(size),
          _buildBottomImage(size),
        ],
      ),
    );
  }

  Widget _buildBackgroundImage(Size size) {
    return SizedBox(
      width: size.width,
      height: size.height * 0.3,
      child: Image.asset(
        profileImages[0],
        fit: BoxFit.cover,
        width: size.width,
      ),
    );
  }

  Widget _buildBottomImage(Size size) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Image.asset(
        'assets/png/home_bottom.png',
        width: size.width,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildKeyFunctions(Size size) {
    return Positioned(
      top: size.height * 0.27,
      child: Container(
        width: size.width,
        height: size.height * 0.7, // Adjusted for different screen sizes
        padding: EdgeInsets.all(size.width * 0.04), // Responsive padding
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(size.width * 0.08),
            topRight: Radius.circular(size.width * 0.08),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.02), // Scaled spacing
            Text(
              "Key Functions",
              style: TextStyle(
                fontSize: size.width * 0.045,
              ), // Responsive font size
            ),
            SizedBox(height: size.height * 0.02),
            KeyFunctionsGrid(), // Prevent overflow
            SizedBox(height: size.height * 0.03),

            Text(
              "Announcement",
              style: TextStyle(fontSize: size.width * 0.045),
            ),
            SizedBox(height: size.height * 0.015),
            AnnouncementCard(
              title: "Title here",
              description:
                  "Description of the announcement in details will come here",
              date: "Posted on: 12/08/2025",
              svgAsset: AppImages.annouce,
            ),
          ],
        ),
      ),
    );
  }
}
