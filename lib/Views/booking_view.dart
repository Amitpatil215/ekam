import 'package:ekam/components/buttons.dart';
import 'package:ekam/components/empty_boxes.dart';
import 'package:ekam/constants/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyBookingView extends StatefulWidget {
  static const String id = "MyBookingView";
  const MyBookingView({Key? key}) : super(key: key);

  @override
  _MyBookingViewState createState() => _MyBookingViewState();
}

class _MyBookingViewState extends State<MyBookingView> {
  List<Map<String, String>> bookings = [
    {
      'date': 'Aug 25, 2023 - 10:00 AM',
      'image': 'assets/images/doc_pr_1.jpg',
      'name': 'Dr. John Doe',
      'address': '123 St, City, Country',
      'id': 'BID1234',
    },
    // Add more bookings here...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Bookings'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: bookings.length,
        itemBuilder: (context, index) {
          var booking = bookings[index];

          return Card(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      booking['date']!,
                      style: TextStyleInventory.regBold,
                    ),
                  ),
                  Divider(
                    indent: 20,
                    endIndent: 20,
                    thickness: 0.5,
                  ),
                  Row(
                    children: [
                      Image.asset(booking['image']!, width: 150, height: 150),
                      EmptyBox.horizontalSpaceSmall,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(booking['name']!,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          Text(
                            booking['address']!,
                          ),
                          Text(
                            'Booking ID: ${booking['id']}',
                          ),
                        ],
                      ),
                    ],
                  ),
                  Divider(
                    indent: 20,
                    endIndent: 20,
                    thickness: 0.5,
                  ),
                  EmptyBox.verticalSpaceMedium,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      HorizontalCustomWidthButton(
                        text: 'Cancel',
                        backgroundColor: Colors.lightBlueAccent.shade100,
                        textColor: Colors.blue.shade900,
                        width: MediaQuery.of(context).size.width * 0.4,
                        onPressed: () {
                          Navigator.pushNamed(context, MyBookingView.id);
                        },
                      ),
                      HorizontalCustomWidthButton(
                        text: 'Reschedule',
                        width: MediaQuery.of(context).size.width * 0.4,
                        onPressed: () {
                          Navigator.pushNamed(context, MyBookingView.id);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
