import 'dart:developer';

import 'package:ekam/ViewModels/appointments_viewmodel.dart';
import 'package:ekam/components/buttons.dart';
import 'package:ekam/Views/package/package_row_widget.dart';
import 'package:ekam/Views/review_summary/review_summary_view.dart';

import 'package:ekam/components/empty_boxes.dart';
import 'package:ekam/components/toasts.dart';
import 'package:ekam/constants/meta_data.dart';
import 'package:ekam/constants/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DurationAndPakcage extends StatelessWidget {
  const DurationAndPakcage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AppointmentsViewModel>(
        builder: (context, appointmentsViewModel, snapshot) {
      return Column(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Select Duration',
                    style: TextStyleInventory.regBold.copyWith(fontSize: 20)),
                EmptyBox.verticalSpaceMedium,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Expanded(
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
                ),
                EmptyBox.verticalSpaceLarge,
                Text('Select Package',
                    style: TextStyleInventory.regBold.copyWith(fontSize: 20)),
                EmptyBox.verticalSpaceMedium,
                Column(
                  children: appointmentsViewModel.appointmentOption?.package
                      ?.map((String key) {
                    return PackageRowItemWidget(
                      title: key,
                      value: packagesDescriptions[key] ?? '',
                      iconData: packagesWithIcon[key],
                      trailing: Radio<String>(
                        value: key,
                        groupValue: appointmentsViewModel.selectedPackage,
                        onChanged: (String? value) {
                          Provider.of<AppointmentsViewModel>(context,
                                  listen: false)
                              .setSelectedPackage(value);
                        },
                      ),
                    );
                  }).toList() as List<Widget>,
                ),
              ],
            ),
          ),
          HorizontalFullWidthButton(
            text: 'Next',
            onPressed: () {
              if (Provider.of<AppointmentsViewModel>(context, listen: false)
                      .selectedDuration ==
                  null) {
                // show toast
                ToastNotifiers.showToast(msg: 'Duration not selected');
                return;
              }
              if (Provider.of<AppointmentsViewModel>(context, listen: false)
                      .selectedPackage ==
                  null) {
                // show toast
                ToastNotifiers.showToast(msg: 'Package not selected');
                log('Package not selected');
                return;
              }
              Navigator.pushNamed(context, ReviewSummaryView.id);
            },
          ),
          EmptyBox.verticalSpaceMedium
        ],
      );
    });
  }
}
