import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:technical_interview/component/header_text.dart';
import 'package:technical_interview/constant/app_colors.dart';
import 'package:technical_interview/view_model/login_controller.dart';
import '../data/models/index.dart';

/// A reusable OTP verification card widget with curved header design
class CurvedOTPCard extends StatelessWidget {
  final TextEditingController? employeeIdController;
  final String title;
  final String subtitle;
  final String employeeId;

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

  /// Default pin size multiplier
  static const double _defaultPinSize = 0.12;

  CurvedOTPCard({
    Key? key,
    required this.employeeId,
    this.employeeIdController,
    this.title = "Just one more step",
    this.subtitle = "We've sent a code to your email john.smith@albusayra.",
  }) : super(key: key);

  final LoginController controller = Get.put(LoginController());

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
            HeaderText(
              text: title,
              fontSize: screenSize.width * 0.05,
              isBold: true,
            ),
            SizedBox(height: screenSize.height * 0.006),
            HeaderText(
              text: subtitle,
              fontSize: screenSize.width * 0.035,
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the OTP input field
  Widget _buildOtpField(Size screenSize) {
    final pinSize = screenSize.width * _defaultPinSize;
    final fontSize = screenSize.width * _defaultFontSize;
    final borderRadius = screenSize.width * 0.02;
    final errorIconSize = screenSize.width * _defaultIconSize;
    final errorFontSize = screenSize.width * 0.035;
    final spacing = screenSize.width * 0.012;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildPinput(pinSize, fontSize, borderRadius),
        _buildErrorMessage(errorIconSize, errorFontSize, spacing),
      ],
    );
  }

  /// Builds the Pinput widget for OTP input
  Widget _buildPinput(double pinSize, double fontSize, double borderRadius) {
    return Pinput(
      length: 6,
      onChanged: (value) => 
          value.isNotEmpty ? controller.updateOtpButtonState() : null,
      controller: controller.otpController,
      keyboardType: TextInputType.number,
      defaultPinTheme: _buildPinTheme(pinSize, fontSize, borderRadius),
      focusedPinTheme: _buildPinTheme(pinSize, fontSize, borderRadius, isFocused: true),
    );
  }

  /// Builds theme for PIN input fields
  PinTheme _buildPinTheme(
    double pinSize, 
    double fontSize, 
    double borderRadius, 
    {bool isFocused = false}
  ) {
    return PinTheme(
      width: pinSize,
      height: pinSize,
      textStyle: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: Colors.grey,
          width: isFocused ? 2 : 1,
        ),
      ),
    );
  }

  /// Builds error message display
  Widget _buildErrorMessage(
    double errorIconSize, 
    double errorFontSize, 
    double spacing
  ) {
    return Obx(
      () => controller.otpErrorMessage.value.isNotEmpty
          ? Padding(
              padding: EdgeInsets.only(top: spacing),
              child: Row(
                children: [
                  Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: errorIconSize,
                  ),
                  SizedBox(width: spacing),
                  Text(
                    controller.otpErrorMessage.value,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: errorFontSize,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            )
          : const SizedBox.shrink(),
    );
  }

  /// Builds the login form section
  Widget _buildLoginForm(Size screenSize, ResponsiveValues values) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInstructions(values.fontSize),
          SizedBox(height: values.spacing),
          _buildOtpField(screenSize),
          SizedBox(height: values.spacing * 2),
          _buildLoginButton(screenSize, values),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  /// Builds instruction text
  Widget _buildInstructions(double fontSize) {
    return Text.rich(
      TextSpan(
        text: "Please check your inbox and insert the code below to sign in.",
        style: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: fontSize,
          color: Color.fromARGB(255, 93, 92, 92),
        ),
      ),
    );
  }

  /// Builds the login button
  Widget _buildLoginButton(Size screenSize, ResponsiveValues values) {
    return Obx(
      () => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: _buildButtonStyle(screenSize, values.buttonPadding),
          onPressed: _getButtonCallback(),
          child: _buildButtonContent(values),
        ),
      ),
    );
  }

  /// Builds button style based on state
  ButtonStyle _buildButtonStyle(Size screenSize, double padding) {
    return ElevatedButton.styleFrom(
      backgroundColor: controller.hasOtpValue.value ? AppColors.blue : Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(screenSize.width * 0.02),
      ),
      padding: EdgeInsets.symmetric(vertical: padding),
    );
  }

  /// Returns button callback based on state
  VoidCallback? _getButtonCallback() {
    return controller.hasOtpValue.value
        ? () => controller.login(employeeId, controller.otpController.text)
        : null;
  }

  /// Builds button content with icon
  Widget _buildButtonContent(ResponsiveValues values) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Login",
          style: TextStyle(
            fontSize: values.fontSize,
            color: Colors.white,
          ),
        ),
        SizedBox(width: values.spacing),
        Icon(
          Icons.login,
          size: values.iconSize,
          color: Colors.white,
        ),
      ],
    );
  }
}

/// Header text widget for consistent styling


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
