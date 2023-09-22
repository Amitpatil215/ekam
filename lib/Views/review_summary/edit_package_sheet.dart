import 'package:ekam/ViewModels/appointments_viewmodel.dart';
import 'package:ekam/Views/select_package_view.dart';
import 'package:ekam/components/buttons.dart';
import 'package:ekam/components/empty_boxes.dart';
import 'package:ekam/components/toasts.dart';
import 'package:ekam/constants/meta_data.dart';
import 'package:ekam/constants/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

editPackageSheet(BuildContext context) {
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
