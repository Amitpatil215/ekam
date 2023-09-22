
import 'package:ekam/components/empty_boxes.dart';
import 'package:ekam/constants/textStyles.dart';
import 'package:flutter/material.dart';

class QuickTileInfo extends StatelessWidget {
  const QuickTileInfo({
    super.key,
    required this.title,
    this.icon,
  });

  final String title;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.blue.shade800,
        ),
        EmptyBox.horizontalSpaceSmall,
        Text(title, style: TextStyleInventory.regBold),
      ],
    );
  }
}
