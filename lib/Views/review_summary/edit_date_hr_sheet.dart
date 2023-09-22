import 'package:ekam/ViewModels/appointments_viewmodel.dart';
import 'package:ekam/components/buttons.dart';
import 'package:ekam/components/horizontal_picker.dart';
import 'package:ekam/components/toasts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

editDatHourSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) => Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Consumer<AppointmentsViewModel>(
                builder: (context, appointmentsViewModel, snapshot) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Day',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: HorizontalPicker(
                      options: appointmentsViewModel
                          .selectedDoctor!.availability.keys
                          .toList(),
                      onPicked: (val) {
                        Provider.of<AppointmentsViewModel>(context,
                            listen: false)
                          ..setSelectedTime(null)
                          ..setSelectedDateAndCurrspondingTime(
                              val,
                              appointmentsViewModel
                                  .selectedDoctor!.availability[val]);
                      },
                    ),
                  ),
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
              text: 'Update',
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

                  return;
                }

                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    ),
  );
}
