import 'dart:developer';

import 'package:ekam/Helpers/get_random_doc_image.dart';
import 'package:ekam/Views/select_package_view.dart';
import 'package:ekam/components/buttons.dart';
import 'package:ekam/components/doc_info_card_widget.dart';
import 'package:ekam/components/empty_boxes.dart';
import 'package:ekam/components/horizontal_picker.dart';
import 'package:ekam/constants/textStyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DocDetailsView extends StatelessWidget {
  static const String id = "DocDetailsView";

  const DocDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Book Appointment'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            DocInfoCardWidget(
              docName: 'Dr. Mukesh Ambani',
              docSpeciality: 'Psychiatrist',
              docLocation: 'UK, US western street',
              fallBackUrl: getRandomDocImage(),
              profileUrl: "",
            ),
            const Divider(
              indent: 10,
              endIndent: 10,
              thickness: 0.5,
            ),
            EmptyBox.verticalSpaceMedium,
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  StatsRowItemWidget(
                    iconData: Icons.people,
                    title: 'Patients',
                    value: '7,500+',
                  ),
                  StatsRowItemWidget(
                    iconData: Icons.work,
                    title: 'Years Exp.',
                    value: '10+',
                  ),
                  StatsRowItemWidget(
                    iconData: Icons.star,
                    title: 'Rating',
                    value: '4.9 +',
                  ),
                  StatsRowItemWidget(
                    iconData: CupertinoIcons.doc_text,
                    title: 'Review',
                    value: '4956',
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Book Appointment',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Day',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: HorizontalPicker(
                options: [
                  "Today \n 4 Oct",
                  "Monday \n 5 Oct",
                  "Tuesday \n 6 Oct"
                ],
                onPicked: (val) {},
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Time',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: HorizontalPicker(
                options: [
                  "7 PM",
                  "8 PM",
                  "9 PM",
                  "10 PM",
                  "11 PM",
                ],
                onPicked: (val) {},
              ),
            ),
            Spacer(),
            HorizontalFullWidthButton(
              text: 'Book Appointment',
              onPressed: () {
                Navigator.pushNamed(context, SelectPackageView.id);
              },
            ),
            EmptyBox.verticalSpaceMedium
          ],
        ),
      ),
    );
  }
}

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
