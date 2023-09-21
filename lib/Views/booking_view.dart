import 'package:ekam/ViewModels/bookings_viewmodel.dart';
import 'package:ekam/Views/doc_list_view.dart';
import 'package:ekam/components/buttons.dart';
import 'package:ekam/components/empty_boxes.dart';
import 'package:ekam/components/toasts.dart';
import 'package:ekam/constants/textStyles.dart';
import 'package:ekam/model/booking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MyBookingView extends StatefulWidget {
  static const String id = "MyBookingView";
  const MyBookingView({Key? key}) : super(key: key);

  @override
  _MyBookingViewState createState() => _MyBookingViewState();
}

class _MyBookingViewState extends State<MyBookingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Bookings'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, DocListView.id, (route) => false);
              },
              icon: Icon(
                Icons.home,
                color: Colors.blue.shade700,
              ))
        ],
      ),
      body:
          Consumer<BookingsViewModel>(builder: (context, bookingsViewModel, _) {
        return ListView.builder(
          itemCount: bookingsViewModel.bookingsList.length,
          itemBuilder: (context, index) {
            Booking booking = bookingsViewModel.bookingsList[index];

            return BookedItemWidget(booking: booking);
          },
        );
      }),
    );
  }
}

class BookedItemWidget extends StatelessWidget {
  const BookedItemWidget({
    super.key,
    required this.booking,
  });

  final Booking booking;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "${booking.appointmentDate} & ${booking.appointmentTime}" ,
                style: TextStyleInventory.regBold,
              ),
            ),
            Divider(
              indent: 10,
              endIndent: 10,
              thickness: 0.5,
            ),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(booking.image ?? "NA",
                      width: 115, height: 115, fit: BoxFit.cover),
                ),
                EmptyBox.horizontalSpaceSmall,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(booking.doctorName ?? "NA",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text(
                      booking.location ?? "NA",
                    ),
                    Text(
                      'Booking ID: ${booking.bookingId ?? "NA"}',
                    ),
                  ],
                ),
              ],
            ),
            EmptyBox.verticalSpaceSmall,
            Divider(
              indent: 10,
              endIndent: 10,
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
                  width: MediaQuery.of(context).size.width * 0.35,
                  onPressed: () {
                    ToastNotifiers.showToast(
                        msg: 'This feature is coming soon');
                  },
                ),
                HorizontalCustomWidthButton(
                  text: 'Reschedule',
                  width: MediaQuery.of(context).size.width * 0.35,
                  onPressed: () {
                    ToastNotifiers.showToast(
                        msg: 'This feature is coming soon');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
