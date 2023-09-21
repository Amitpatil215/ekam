import 'package:ekam/Helpers/get_random_doc_image.dart';
import 'package:ekam/Views/confirmation_view.dart';
import 'package:ekam/Views/select_package_view.dart';
import 'package:ekam/components/buttons.dart';
import 'package:ekam/components/doc_info_card_widget.dart';
import 'package:ekam/components/empty_boxes.dart';
import 'package:ekam/constants/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // for date formatting

class ReviewSummaryView extends StatefulWidget {
  static const String id = "ReviewSummaryView";
  const ReviewSummaryView({Key? key}) : super(key: key);

  @override
  _ReviewSummaryViewState createState() => _ReviewSummaryViewState();
}

class _ReviewSummaryViewState extends State<ReviewSummaryView> {
  DateTime? _selectedDateTime;
  String? _selectedDuration;
  String? _selectedPackage;
  String? _bookingFor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Review Summary'),
        centerTitle: true,
      ),
      body: Padding(
          padding: EdgeInsets.all(20.0),
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Column(
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
                          buildRow(
                              'Date & Hour:',
                              _selectedDateTime != null
                                  ? DateFormat('dd/MM/yyyy – kk:mm')
                                      .format(_selectedDateTime!)
                                  : 'Not selected'),
                          EmptyBox.verticalSpaceMedium,
                          buildRow(
                              'Package:', _selectedPackage ?? 'Not selected'),
                          EmptyBox.verticalSpaceMedium,
                          buildRow(
                              'Duration:', _selectedDuration ?? 'Not selected'),
                          EmptyBox.verticalSpaceMedium,
                          buildRow(
                              'Booking For:', _bookingFor ?? 'Not selected'),
                          EmptyBox.verticalSpaceMedium,
                        ],
                      ),
                    ),
                    HorizontalFullWidthButton(
                      text: 'Confirm',
                      onPressed: () {
                        Navigator.pushNamed(context, ConfirmationView.id);
                      },
                    ),
                    EmptyBox.verticalSpaceMedium
                  ],
                ),
              ),
            ],
          )),
    );
  }

  Row buildRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(title,style: TextStyleInventory.reg),
        Text(value, style: TextStyleInventory.regBold),
      ],
    );
  }
}
