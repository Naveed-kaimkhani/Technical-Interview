import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:technical_interview/constant/app_images.dart';

class KeyFunctionsGrid extends StatelessWidget {
  final List<Map<String, dynamic>> functions = [
    {'icon': AppImages.write, 'label': 'Request'},
    {'icon': AppImages.error, 'label': 'Complaint'},
    {'icon': AppImages.page, 'label': 'Salary Slip'},
    {'icon': AppImages.user, 'label': 'Chat'},
    {'icon': AppImages.cash, 'label': 'Loan Balance'},
    {'icon': AppImages.hand, 'label': 'Asset Acceptance'},
    {'icon': AppImages.update, 'label': 'Update Information'},
    {'icon': AppImages.phone, 'label': 'Emergency Contact'},
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final crossAxisCount = 4;

    final itemSpacing = screenSize.width * 0.04;
    final iconSize = screenSize.width * 0.09;
    final fontSize = screenSize.width * 0.03;

    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: itemSpacing,
        mainAxisSpacing: itemSpacing,
        childAspectRatio: 1.2,
      ),
      itemCount: functions.length,
      itemBuilder: (context, index) {
        return FunctionTile(
          icon: functions[index]['icon'],
          label: functions[index]['label'],
          iconSize: iconSize,
          fontSize: fontSize,
        );
      },
    );
  }
}

class FunctionTile extends StatelessWidget {
  final String icon;
  final String label;
  final double iconSize;
  final double fontSize;

  const FunctionTile({
    required this.icon,
    required this.label,
    required this.iconSize,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          height: constraints.maxHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(icon, height: iconSize, width: iconSize),
              Flexible(
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromARGB(255, 145, 145, 145),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
