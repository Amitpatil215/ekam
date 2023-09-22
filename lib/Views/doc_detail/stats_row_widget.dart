
import 'package:ekam/components/empty_boxes.dart';
import 'package:ekam/constants/textStyles.dart';
import 'package:flutter/material.dart';

class StatsRowItemWidget extends StatelessWidget {
  final String title;
  final String value;
  final IconData? iconData;

  const StatsRowItemWidget({
    this.title = '',
    this.value = '',
    this.iconData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CircleAvatar(
          radius: 30,
          child: Icon(
            iconData,
            size: 25,
            color: Colors.blue.shade700,
          ),
        ),
        EmptyBox.verticalSpaceTiny,
        Text(
          value,
          style: TextStyleInventory.regBold.copyWith(color: Colors.blue),
        ),
        Text(title),
      ],
    );
  }
}
