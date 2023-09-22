import 'package:ekam/ViewModels/bookings_viewmodel.dart';
import 'package:ekam/Views/booking/booked_item_widget.dart';
import 'package:ekam/Views/doc_list_view.dart';

import 'package:ekam/model/booking.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyBookingView extends StatefulWidget {
  static const String id = "MyBookingView";
  const MyBookingView({Key? key}) : super(key: key);

  @override
  State<MyBookingView> createState() => _MyBookingViewState();
}

class _MyBookingViewState extends State<MyBookingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Bookings'),
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
