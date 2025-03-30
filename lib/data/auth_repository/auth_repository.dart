// lib/repositories/auth_repository.dart
import 'package:technical_interview/data/models/user_model.dart';

abstract class AuthRepository {
  UserModel? loginWithEmployeeIdndOtp(String employeeId, String otp);

  bool isEmployeeIdExists(String employeeId);
}
