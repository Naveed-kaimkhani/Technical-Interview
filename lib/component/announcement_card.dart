import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnnouncementCard extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final String svgAsset;

  const AnnouncementCard({
    required this.title,
    required this.description,
    required this.date,
    required this.svgAsset,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = size.width * 0.03; 
    final iconSize = size.width * 0.1; // 10% of screen width
    final borderRadius = size.width * 0.03; // 3% of screen width
    final spacingWidth = size.width * 0.03; // 3% of screen width
    final spacingHeight = size.height * 0.006; // 0.6% of screen height

    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(padding),
              child: SvgPicture.asset(
                svgAsset,
                height: iconSize,
                width: iconSize,
              ),
            ),
            SizedBox(width: spacingWidth),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: size.width * 0.04,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: spacingHeight),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: size.width * 0.035,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  SizedBox(height: spacingHeight),
                  Text(
                    "Posted on: $date",
                    style: TextStyle(
                      fontSize: size.width * 0.03,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
