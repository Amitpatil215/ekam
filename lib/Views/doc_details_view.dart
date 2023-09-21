import 'dart:developer';

import 'package:ekam/Helpers/get_random_doc_image.dart';
import 'package:ekam/ViewModels/appointments_viewmodel.dart';
import 'package:ekam/ViewModels/doc_details_viewmodel.dart';
import 'package:ekam/Views/select_package_view.dart';
import 'package:ekam/components/buttons.dart';
import 'package:ekam/components/doc_info_card_widget.dart';
import 'package:ekam/components/empty_boxes.dart';
import 'package:ekam/components/horizontal_picker.dart';
import 'package:ekam/components/toasts.dart';
import 'package:ekam/constants/textStyles.dart';
import 'package:ekam/model/doctor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DocDetailsView extends StatefulWidget {
  static const String id = "DocDetailsView";
  final String docName;
  const DocDetailsView({
    super.key,
    required this.docName,
  });

  @override
  State<DocDetailsView> createState() => _DocDetailsViewState();
}

class _DocDetailsViewState extends State<DocDetailsView> {
  late Doctor doctor;
  @override
  void initState() {
    doctor = Provider.of<DocDetailsViewModel>(context, listen: false)
        .getDoctorByName(widget.docName);
    super.initState();
  }

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
              docName: doctor.doctorName,
              docSpeciality: doctor.speciality,
              docLocation: doctor.location,
              fallBackUrl: doctor.fallBackUrl,
              profileUrl: doctor.image,
            ),
            const Divider(
              indent: 10,
              endIndent: 10,
              thickness: 0.5,
            ),
            EmptyBox.verticalSpaceMedium,
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  StatsRowItemWidget(
                    iconData: Icons.people,
                    title: 'Patients',
                    value: "${doctor.patientsServed.toString()}+",
                  ),
                  StatsRowItemWidget(
                    iconData: Icons.work,
                    title: 'Years Exp.',
                    value: "${doctor.yearsOfExperience.toString()}+",
                  ),
                  StatsRowItemWidget(
                    iconData: Icons.star,
                    title: 'Rating',
                    value: "${doctor.rating.toString()}+",
                  ),
                  StatsRowItemWidget(
                    iconData: CupertinoIcons.doc_text,
                    title: 'Review',
                    value: "${doctor.numberOfReviews.toString()}+",
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
                options: doctor.availability.keys.toList(),
                onPicked: (val) {
                  Provider.of<AppointmentsViewModel>(context, listen: false)
                      .setSelectedDateAndCurrspondingTime(
                          val, doctor.availability[val]);
                },
              ),
            ),
            Consumer<AppointmentsViewModel>(
                builder: (context, appointmentsViewModel, snapshot) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (appointmentsViewModel.selectedDate != null)
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Time',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                    ),
                  if (appointmentsViewModel.timeSlots.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: HorizontalPicker(
                        options: appointmentsViewModel.timeSlots,
                        onPicked: (val) {
                          Provider.of<AppointmentsViewModel>(context,
                                  listen: false)
                              .setSelectedTime(
                            val,
                          );
                        },
                      ),
                    ),
                  if (appointmentsViewModel.timeSlots.isEmpty &&
                      appointmentsViewModel.selectedDate != null)
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text("No slots available for the selected date"),
                    )
                ],
              );
            }),
            const Spacer(),
            HorizontalFullWidthButton(
              text: 'Book Appointment',
              onPressed: () {
                // check if date and time is selected
                if (Provider.of<AppointmentsViewModel>(context, listen: false)
                        .selectedDate ==
                    null) {
                  // show toast
                  ToastNotifiers.showToast(msg: 'Date not selected');
                  return;
                }
                if (Provider.of<AppointmentsViewModel>(context, listen: false)
                        .selectedTime ==
                    null) {
                  // show toast
                  ToastNotifiers.showToast(msg: 'Time not selected');
                  log('Time not selected');
                  return;
                }

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
