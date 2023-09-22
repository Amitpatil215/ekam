import 'package:ekam/ViewModels/appointments_viewmodel.dart';
import 'package:ekam/Views/package/select_package_view.dart';
import 'package:ekam/components/buttons.dart';
import 'package:ekam/components/empty_boxes.dart';
import 'package:ekam/components/toasts.dart';
import 'package:ekam/constants/meta_data.dart';
import 'package:ekam/constants/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

editDurationSheet(BuildContext context) {
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
                  Text('Select Duration',
                      style: TextStyleInventory.regBold.copyWith(fontSize: 20)),
                  EmptyBox.verticalSpaceMedium,
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InputDecorator(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      )),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: appointmentsViewModel.selectedDuration,
                          hint: const Text('Select Duration'),
                          isExpanded: true,
                          isDense: true,
                          onChanged: (String? newValue) {
                            Provider.of<AppointmentsViewModel>(context,
                                    listen: false)
                                .setSelectedDuration(newValue);
                          },
                          items: appointmentsViewModel
                              .appointmentOption?.duration
                              ?.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Row(
                                children: [
                                  Icon(Icons.access_time,
                                      color: Colors.blue.shade700),
                                  EmptyBox.horizontalSpaceTiny,
                                  Text(value,
                                      style: TextStyleInventory.regBold),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
            const Spacer(),
            HorizontalFullWidthButton(
              text: 'Update',
              onPressed: () {
                // check if date and time is selected
                if (Provider.of<AppointmentsViewModel>(context, listen: false)
                        .selectedPackage ==
                    null) {
                  // show toast
                  ToastNotifiers.showToast(msg: 'Package not selected');
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
