// import 'dart:developer';
// import 'package:technical_interview/data/auth_repository/auth_repository.dart';
// import 'package:technical_interview/data/models/user_model.dart';

// class MockAuthRepo extends AuthRepository {
//   // Dummy data for users
//   final List<UserModel> users = [
//      UserModel(
//     id: 'ABDS-12345',
//     name: 'John Doe',
//     phone: '9876543210',
//     otp: '324869',
//     email: 'john.doe@example.com',
//     company: 'Tech Solutions Inc.',
//     platform: 'Bikeya - 12345',
//   ),
//   UserModel(
//     id: 'ABDS-67890',
//     name: 'Jane Smith',
//     phone: '1234567890',
//     otp: '441082',
//     email: 'jane.smith@example.com',
//     company: 'Digital Innovations LLC',
//     platform: 'InDrive - 12345',
//   ),
//   ];

//   // Function to simulate login with employee ID and OTP
//   @override
//   UserModel? loginWithEmployeeIdndOtp(
//     String employeeId,
//     String otp,
//   ) {
//     // Simulate a delay

//     // Find user by employee ID
//     final user = users.firstWhere(
//       (user) => user.id == employeeId,
//       orElse: () => UserModel(id: '', name: '', phone: '', otp: '',platform: '',email: '',company: ''),
//     );

//     // If user found and OTP matches, return user data
//     if (user.id.isNotEmpty && user.otp == otp) {
//       log("true");
//       return user;
//     } else {
//       return null; // Return null if invalid login or OTP
//     }
//   }

//   @override
//   bool isEmployeeIdExists(String employeeId)  {
//     return users.any((user) => user.id == employeeId);
//   }
// }


import 'dart:developer';
import 'package:technical_interview/data/auth_repository/auth_repository.dart';
import 'package:technical_interview/data/models/user_model.dart';

class MockAuthRepo extends AuthRepository {
  // Dummy data for users as a list of JSON-like objects
  final List<Map<String, dynamic>> userJsonData = [
    {
      'id': 'ABDS-12345',
      'name': 'John Doe',
      'phone': '9876543210',
      'otp': '324869',
      'email': 'john.doe@example.com',
      'company': 'Tech Solutions Inc.',
      'platform': 'Bikeya - 12345',
    },
    {
      'id': 'ABDS-67890',
      'name': 'Jane Smith',
      'phone': '1234567890',
      'otp': '441082',
      'email': 'jane.smith@example.com',
      'company': 'Digital Innovations LLC',
      'platform': 'InDrive - 12345',
    },
  ];

  // Convert user JSON data to UserModel objects
  List<UserModel> get users => userJsonData
      .map((userJson) => UserModel.fromJson(userJson))
      .toList();

  // Function to simulate login with employee ID and OTP
  @override
  UserModel? loginWithEmployeeIdndOtp(
    String employeeId,
    String otp,
  ) {
    // Simulate a delay
    // Find user by employee ID
    final user = users.firstWhere(
      (user) => user.id == employeeId,
      orElse: () => UserModel(id: '', name: '', phone: '', otp: '', platform: '', email: '', company: ''),
    );

    // If user found and OTP matches, return user data
    if (user.id.isNotEmpty && user.otp == otp) {
      log("true");
      return user;
    } else {
      return null; // Return null if invalid login or OTP
    }
  }

  @override
  bool isEmployeeIdExists(String employeeId) {
    return users.any((user) => user.id == employeeId);
  }
}
