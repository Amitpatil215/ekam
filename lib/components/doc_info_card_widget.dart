
import 'dart:developer';

import 'package:ekam/components/empty_boxes.dart';
import 'package:ekam/constants/textStyles.dart';
import 'package:flutter/material.dart';

class DocInfoCardWidget extends StatelessWidget {
  final String docName;
  final String docSpeciality;
  final String docLocation;
  final String profileUrl;
  final String fallBackUrl;

  const DocInfoCardWidget({
    super.key,
    this.docName = '',
    this.docSpeciality = '',
    this.docLocation = '',
    this.profileUrl = '',
    this.fallBackUrl = 'assets/images/doc1.png',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          SizedBox(
            height: 100,
            width: 100,
            child: CircleAvatar(
              backgroundColor: Colors.red,
              backgroundImage: AssetImage(
                fallBackUrl,
              ),
              // foregroundImage: NetworkImage(profileUrl),
              // onForegroundImageError: (er, st) {
              //   log(er.toString());
              // },
            ),
          ),
          EmptyBox.horizontalSpaceLarge,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                docName,
                style: TextStyleInventory.regBold,
              ),
              Text(docSpeciality),
              EmptyBox.verticalSpaceTiny,
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    size: 15,
                    color: Colors.blueAccent,
                  ),
                  Text(docLocation),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}