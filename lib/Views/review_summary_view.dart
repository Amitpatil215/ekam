import 'dart:math';

import 'package:ekam/Helpers/get_random_doc_image.dart';
import 'package:ekam/ViewModels/appointments_viewmodel.dart';
import 'package:ekam/ViewModels/bookings_viewmodel.dart';
import 'package:ekam/Views/confirmation_view.dart';
import 'package:ekam/Views/select_package_view.dart';
import 'package:ekam/components/buttons.dart';
import 'package:ekam/components/doc_info_card_widget.dart';
import 'package:ekam/components/empty_boxes.dart';
import 'package:ekam/constants/textStyles.dart';
import 'package:ekam/model/booking.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart'; // for date formatting

class ReviewSummaryView extends StatefulWidget {
  static const String id = "ReviewSummaryView";
  const ReviewSummaryView({Key? key}) : super(key: key);

  @override
  _ReviewSummaryViewState createState() => _ReviewSummaryViewState();
}

class _ReviewSummaryViewState extends State<ReviewSummaryView> {
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
                      child: Consumer<AppointmentsViewModel>(
                          builder: (context, appointmentsViewModel, _) {
                        return Column(
                          children: <Widget>[
                            DocInfoCardWidget(
                              docName: appointmentsViewModel
                                  .selectedDoctor!.doctorName,
                              docSpeciality: appointmentsViewModel
                                  .selectedDoctor!.speciality,
                              docLocation: appointmentsViewModel
                                  .selectedDoctor!.location,
                              fallBackUrl: appointmentsViewModel
                                  .selectedDoctor!.fallBackUrl,
                              profileUrl: appointmentsViewModel
                                  .selectedDoctor!.fallBackUrl,
                            ),
                            const Divider(
                              indent: 10,
                              endIndent: 10,
                              thickness: 0.5,
                            ),
                            EmptyBox.verticalSpaceMedium,
                            buildRow('Date & Hour:',
                                "${appointmentsViewModel.selectedDate} & ${appointmentsViewModel.selectedTime}"),
                            EmptyBox.verticalSpaceMedium,
                            buildRow(
                                'Package:',
                                appointmentsViewModel.selectedPackage ??
                                    'Not selected'),
                            EmptyBox.verticalSpaceMedium,
                            buildRow(
                                'Duration:',
                                appointmentsViewModel.selectedDuration ??
                                    'Not selected'),
                            EmptyBox.verticalSpaceMedium,
                            buildRow('Booking For:', "Self"),
                            EmptyBox.verticalSpaceMedium,
                          ],
                        );
                      }),
                    ),
                    HorizontalFullWidthButton(
                      text: 'Confirm',
                      onPressed: () {
                        Provider.of<BookingsViewModel>(context, listen: false)
                            .addNewBooking(Booking(
                          appointmentDate: Provider.of<AppointmentsViewModel>(
                                  context,
                                  listen: false)
                              .selectedDate,
                          appointmentTime: Provider.of<AppointmentsViewModel>(
                                  context,
                                  listen: false)
                              .selectedTime,
                          bookingId: "CQ${Random().nextInt(100000).toString()}",
                          doctorName: Provider.of<AppointmentsViewModel>(
                                  context,
                                  listen: false)
                              .selectedDoctor!
                              .doctorName,
                          location: Provider.of<AppointmentsViewModel>(context,
                                  listen: false)
                              .selectedDoctor!
                              .location,
                          image: Provider.of<AppointmentsViewModel>(context,
                                  listen: false)
                              .selectedDoctor!
                              .fallBackUrl,
                        ));
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
        Text(title, style: TextStyleInventory.reg),
        Text(value, style: TextStyleInventory.regBold),
      ],
    );
  }
}
