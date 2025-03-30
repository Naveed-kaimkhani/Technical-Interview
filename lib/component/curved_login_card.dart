import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_interview/component/custom_text_field.dart';
import 'package:technical_interview/constant/app_colors.dart';
import 'package:technical_interview/view_model/login_controller.dart';
import '../data/models/index.dart';

/// A reusable login card widget with curved header design
class CurvedLoginCard extends StatelessWidget {
  /// Callback when login button is pressed
  final VoidCallback? onLoginPressed;

  /// Controller for employee ID text field
  final TextEditingController? employeeIdController;

  /// Hint text for employee ID field
  final String? employeeIdHint;

  /// Title text shown in header
  final String title;

  /// Subtitle text shown in header
  final String subtitle;

  /// Default spacing between elements
  static const double _defaultSpacing = 0.01;

  /// Default button padding
  static const double _defaultButtonPadding = 0.018;

  /// Default font size multiplier
  static const double _defaultFontSize = 0.04;

  /// Default icon size multiplier  
  static const double _defaultIconSize = 0.05;

  /// Default card width multiplier
  static const double _defaultCardWidth = 0.9;

  /// Default card height multiplier
  static const double _defaultCardHeight = 0.42;

  /// Default header height multiplier
  static const double _defaultHeaderHeight = 0.18;

  /// Maximum card width
  static const double _maxCardWidth = 350.0;

  const CurvedLoginCard({
    Key? key,
    this.onLoginPressed,
    this.employeeIdController,
    this.employeeIdHint = "ABDS-12345",
    this.title = "Login your account",
    this.subtitle =
        "Please use your employee id provided by your organization to log in.",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final responsiveValues = _getResponsiveValues(screenSize);

    return Center(
      child: _buildCard(screenSize, responsiveValues),
    );
  }

  /// Calculates responsive values based on screen size
  ResponsiveValues _getResponsiveValues(Size screenSize) {
    return ResponsiveValues(
      cardWidth: screenSize.width * _defaultCardWidth > _maxCardWidth 
          ? _maxCardWidth 
          : screenSize.width * _defaultCardWidth,
      cardHeight: screenSize.height * _defaultCardHeight,
      fontSize: screenSize.width * _defaultFontSize,
      iconSize: screenSize.width * _defaultIconSize,
      buttonPadding: screenSize.height * _defaultButtonPadding,
      spacing: screenSize.height * _defaultSpacing,
      headerHeight: screenSize.height * _defaultHeaderHeight,
    );
  }

  /// Builds the main card widget
  Widget _buildCard(Size screenSize, ResponsiveValues values) {
    return Container(
      width: values.cardWidth,
      height: values.cardHeight,
      decoration: _buildCardDecoration(screenSize),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHeader(screenSize, values.headerHeight),
          _buildLoginForm(screenSize, values),
        ],
      ),
    );
  }

  /// Builds card decoration with shadow
  BoxDecoration _buildCardDecoration(Size screenSize) {
    return BoxDecoration(
      color: AppColors.appColor,
      borderRadius: BorderRadius.circular(screenSize.width * 0.04),
      boxShadow: [
        BoxShadow(
          color: Colors.black26,
          blurRadius: screenSize.width * 0.02,
          spreadRadius: screenSize.width * 0.005,
          offset: Offset(0, screenSize.width * 0.01),
        ),
      ],
    );
  }

  /// Builds the curved header section
  Widget _buildHeader(Size screenSize, double headerHeight) {
    return ClipPath(
      clipper: UpwardCurveClipper(),
      child: Container(
        width: double.infinity,
        height: headerHeight,
        decoration: _buildHeaderDecoration(screenSize),
        child: _buildHeaderContent(screenSize),
      ),
    );
  }

  /// Builds header decoration with gradient
  BoxDecoration _buildHeaderDecoration(Size screenSize) {
    return BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(screenSize.width * 0.04),
        topRight: Radius.circular(screenSize.width * 0.04),
      ),
      gradient: AppColors.appGradientColors,
    );
  }

  /// Builds header content with title and subtitle
  Widget _buildHeaderContent(Size screenSize) {
    return Padding(
      padding: EdgeInsets.all(screenSize.width * 0.04),
      child: Align(
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _HeaderText(
              text: title,
              fontSize: screenSize.width * 0.05,
              isBold: true,
            ),
            SizedBox(height: screenSize.height * 0.006),
            _HeaderText(
              text: subtitle,
              fontSize: screenSize.width * 0.035,
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the login form section
  Widget _buildLoginForm(Size screenSize, ResponsiveValues values) {
    final loginController = Get.put(LoginController());

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildEmployeeIdLabel(values.fontSize),
          SizedBox(height: values.spacing),
          CustomTextField(
            controller: loginController,
            employeeIdHint: employeeIdHint,
          ),
          SizedBox(height: values.spacing * 2),
          _buildLoginButton(loginController, screenSize, values),
        ],
      ),
    );
  }

  /// Builds the employee ID label with required asterisk
  Widget _buildEmployeeIdLabel(double fontSize) {
    return Text.rich(
      TextSpan(
        text: "Employee ID ",
        style: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: fontSize,
        ),
        children: [
          TextSpan(
            text: "*",
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: fontSize,
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the login button with reactive state
  Widget _buildLoginButton(
    LoginController controller,
    Size screenSize,
    ResponsiveValues values,
  ) {
    return Obx(
      () => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: _buildButtonStyle(controller, screenSize, values.buttonPadding),
          onPressed: _getButtonCallback(controller),
          child: _buildButtonContent(values),
        ),
      ),
    );
  }

  /// Builds button style based on state
  ButtonStyle _buildButtonStyle(
    LoginController controller,
    Size screenSize,
    double padding,
  ) {
    return ElevatedButton.styleFrom(
      backgroundColor: controller.hasText.value ? AppColors.blue : Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(screenSize.width * 0.02),
      ),
      padding: EdgeInsets.symmetric(vertical: padding),
    );
  }

  /// Returns button callback based on state
  VoidCallback? _getButtonCallback(LoginController controller) {
    return controller.hasText.value
        ? () => controller.checkEmployeeIdExists(
              controller.employeeIdController.text,
            )
        : null;
  }

  /// Builds button content with icon
  Widget _buildButtonContent(ResponsiveValues values) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Login",
          style: TextStyle(fontSize: values.fontSize, color: Colors.white),
        ),
        SizedBox(width: values.spacing),
        Icon(Icons.login, size: values.iconSize, color: Colors.white),
      ],
    );
  }
}

/// Helper class to store responsive values


/// Header text widget for consistent styling
class _HeaderText extends StatelessWidget {
  final String text;
  final double fontSize;
  final bool isBold;

  const _HeaderText({
    required this.text,
    required this.fontSize,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: fontSize,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}

/// Custom clipper for curved header effect
class UpwardCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height - 20);
    path.quadraticBezierTo(
      size.width * 0.3,
      size.height - 60,
      size.width,
      size.height,
    );
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
