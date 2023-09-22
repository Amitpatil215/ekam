import 'dart:math';

import 'package:ekam/ViewModels/appointments_viewmodel.dart';
import 'package:ekam/ViewModels/bookings_viewmodel.dart';
import 'package:ekam/Views/confirmation/confirmation_view.dart';
import 'package:ekam/Views/review_summary/edit_date_hr_sheet.dart';
import 'package:ekam/Views/review_summary/edit_duration.dart';
import 'package:ekam/Views/review_summary/edit_package_sheet.dart';
import 'package:ekam/components/buttons.dart';
import 'package:ekam/components/doc_info_card_widget.dart';
import 'package:ekam/components/empty_boxes.dart';
import 'package:ekam/constants/textStyles.dart';
import 'package:ekam/model/booking.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 

class ReviewSummaryView extends StatefulWidget {
  static const String id = "ReviewSummaryView";
  const ReviewSummaryView({Key? key}) : super(key: key);

  @override
  State<ReviewSummaryView> createState() => _ReviewSummaryViewState();
}

class _ReviewSummaryViewState extends State<ReviewSummaryView> {
  @override
  Widget build(BuildContext context) {
    var horizontalFullWidthButton = HorizontalFullWidthButton(
      text: 'Confirm',
      onPressed: () {
        Provider.of<BookingsViewModel>(context, listen: false)
            .addNewBooking(Booking(
          appointmentDate:
              Provider.of<AppointmentsViewModel>(context, listen: false)
                  .selectedDate,
          appointmentTime:
              Provider.of<AppointmentsViewModel>(context, listen: false)
                  .selectedTime,
          bookingId: "CQ${Random().nextInt(100000).toString()}",
          doctorName: Provider.of<AppointmentsViewModel>(context, listen: false)
              .selectedDoctor!
              .doctorName,
          location: Provider.of<AppointmentsViewModel>(context, listen: false)
              .selectedDoctor!
              .location,
          image: Provider.of<AppointmentsViewModel>(context, listen: false)
              .selectedDoctor!
              .fallBackUrl,
        ));
        Navigator.pushNamed(context, ConfirmationView.id);
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review Summary'),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.all(20.0),
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
                            BuildRow(
                              title: 'Date & Hour:',
                              value:
                                  "${appointmentsViewModel.selectedDate} & ${appointmentsViewModel.selectedTime}",
                              onTap: () {
                                editDatHourSheet(context);
                              },
                            ),
                            EmptyBox.verticalSpaceMedium,
                            BuildRow(
                              title: 'Package:',
                              value: appointmentsViewModel.selectedPackage ??
                                  'Not selected',
                              onTap: () {
                                editPackageSheet(context);
                              },
                            ),
                            EmptyBox.verticalSpaceMedium,
                            BuildRow(
                                title: 'Duration:',
                                value: appointmentsViewModel.selectedDuration ??
                                    'Not selected',
                                onTap: () {
                                  editDurationSheet(context);
                                }),
                            EmptyBox.verticalSpaceMedium,
                            const BuildRow(
                                title: 'Booking For:',
                                value: "Self",
                                isShowEdit: false),
                            EmptyBox.verticalSpaceMedium,
                          ],
                        );
                      }),
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          "Tip: You can edit your booking by clicking on the respective field.",
                        ),
                      ),
                    ),
                    horizontalFullWidthButton,
                    EmptyBox.verticalSpaceMedium
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

class BuildRow extends StatelessWidget {
  const BuildRow({
    this.title = "",
    this.value = "",
    this.isShowEdit = true,
    this.onTap,
    super.key,
  });
  final String title;
  final String value;
  final bool isShowEdit;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(title, style: TextStyleInventory.reg),
        const Spacer(),
        Text(value, style: TextStyleInventory.regBold),
        if (isShowEdit) ...[
          EmptyBox.horizontalSpaceTiny,
          GestureDetector(
            onTap: onTap,
            child: Icon(Icons.edit, size: 16, color: Colors.blue.shade700),
          )
        ]
      ],
    );
  }
}
