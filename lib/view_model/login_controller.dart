import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_interview/routes/routes_name.dart';
import '../data/auth_repository/index.dart';
import '../data/models/index.dart';

class LoginController extends GetxController {
  final TextEditingController employeeIdController = TextEditingController();

  final TextEditingController otpController = TextEditingController();
  final RxBool hasText = false.obs;
  final RxBool hasOtpValue = false.obs;
  final AuthRepository authRepository = Get.find<AuthRepository>();

  Rx<UserModel?> loggedInUser = Rx<UserModel?>(null);
  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs; // To store the error message
  RxString otpErrorMessage = ''.obs; // To store the error message

  LoginController();

  void updateOtpButtonState() {
    hasOtpValue.value = otpController.text.isNotEmpty;
  }

  void updateButtonState() {
    hasText.value = employeeIdController.text.isNotEmpty;
  }

  // Separate method to check if employee ID exists
  bool checkEmployeeIdExists(String employeeId)  {
    bool employeeExists =  authRepository.isEmployeeIdExists(employeeId);
    if (!employeeExists) {
      errorMessage.value =
          "Please type the correct id."; // Set the error message
      return false;
    }
    Get.toNamed(RouteName.otpScreencreen, arguments: employeeId);
    // Clear error message if employee ID is valid
    return true;
  }

  // Method for logging in
  Future<void> login(String employeeId, String otp) async {
    isLoading.value = true;

    // Check if the employee ID exists
    bool employeeExists =  checkEmployeeIdExists(employeeId);

    if (!employeeExists) {
      isLoading.value = false;
      return; // Early exit if the employee ID does not exist
    }

    // If employee ID exists, proceed with OTP verification
    final user =  authRepository.loginWithEmployeeIdndOtp(employeeId, otp);
    isLoading.value = false;

    if (user != null) {
      // User is authenticated successfully
      loggedInUser.value = user;
      Get.toNamed(RouteName.userProfile); // Navigate to OTP verification screen
    } else {
      otpErrorMessage.value = "Wrong OTP";
    }
  }

  @override
  void onClose() {
    employeeIdController
        .dispose(); // Dispose the controller to avoid memory leaks
    super.onClose();
  }
}
