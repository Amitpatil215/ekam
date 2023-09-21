import 'package:ekam/Views/booking_view.dart';
import 'package:ekam/Views/select_package_view.dart';
import 'package:ekam/components/buttons.dart';
import 'package:ekam/components/empty_boxes.dart';
import 'package:ekam/constants/textStyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConfirmationView extends StatefulWidget {
  static const String id = "ConfirmationView";

  const ConfirmationView({Key? key}) : super(key: key);

  @override
  _ConfirmationViewState createState() => _ConfirmationViewState();
}

class _ConfirmationViewState extends State<ConfirmationView> {
  // Replace with actual data
  final String docName = "Dr. Smith";
  final String date = "30 Sep, 2023";
  final String time = "10:30 AM";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirmation'),
        centerTitle: true,
      ),
      body: Center(
          child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: <Widget>[
                Expanded(
                    child: Column(
                  children: <Widget>[
                    const SizedBox(height: 50),
                    const CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.check, size: 50, color: Colors.white),
                    ),
                    const SizedBox(height: 20),
                    const Text('Appointment Confirmed',
                        style: TextStyleInventory.regBold),
                    EmptyBox.verticalSpaceMedium,
                    const Text("You have successfully booked appointment with",
                        style: TextStyleInventory.reg,
                        textAlign: TextAlign.center),
                    Text(docName,
                        style: TextStyleInventory.regBold,
                        textAlign: TextAlign.center),
                    EmptyBox.verticalSpaceMedium,
                    const Divider(
                      indent: 20,
                      endIndent: 20,
                      thickness: 0.5,
                    ),
                    EmptyBox.verticalSpaceMedium,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          QuickTileInfo(
                              title: docName, icon: CupertinoIcons.person_fill),
                        ],
                      ),
                    ),
                    EmptyBox.verticalSpaceMedium,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          QuickTileInfo(
                              title: date, icon: CupertinoIcons.calendar),
                          QuickTileInfo(
                              title: time, icon: CupertinoIcons.clock_fill),
                        ],
                      ),
                    ),
                  ],
                )),
                HorizontalFullWidthButton(
                  text: 'View Appointment',
                  onPressed: () {
                    Navigator.pushNamed(context, MyBookingView.id);
                  },
                ),
                EmptyBox.verticalSpaceSmall,
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Book Another",
                    style: TextStyleInventory.regBold,
                  ),
                ),
                EmptyBox.verticalSpaceMedium
              ],
            ),
          ),
        ],
      )),
    );
  }
}

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
