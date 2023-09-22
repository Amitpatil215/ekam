
import 'package:ekam/components/empty_boxes.dart';
import 'package:ekam/constants/textStyles.dart';
import 'package:flutter/material.dart';

class PackageRowItemWidget extends StatelessWidget {
  final String title;
  final String value;
  final IconData? iconData;
  final Widget trailing;

  const PackageRowItemWidget({
    this.title = '',
    this.value = '',
    this.iconData,
    this.trailing = const SizedBox(),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueGrey.shade100, width: 1.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 30,
            child: Icon(
              iconData,
              size: 25,
              color: Colors.blue.shade700,
            ),
          ),
          EmptyBox.horizontalSpaceSmall,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyleInventory.regBold),
              Text(
                value,
              ),
            ],
          ),
          const Spacer(),
          trailing,
        ],
      ),
    );
  }
}
