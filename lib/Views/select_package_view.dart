import 'dart:developer';

import 'package:ekam/ViewModels/appointments_viewmodel.dart';
import 'package:ekam/Views/review_summary_view.dart';
import 'package:ekam/components/buttons.dart';
import 'package:ekam/components/empty_boxes.dart';
import 'package:ekam/components/toasts.dart';
import 'package:ekam/constants/meta_data.dart';
import 'package:ekam/constants/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectPackageView extends StatefulWidget {
  static const String id = "SelectPackageView";
  const SelectPackageView({Key? key}) : super(key: key);

  @override
  _SelectPackageViewState createState() => _SelectPackageViewState();
}

class _SelectPackageViewState extends State<SelectPackageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Package'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Consumer<AppointmentsViewModel>(
                  builder: (context, appointmentsViewModel, snapshot) {
                return Column(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Select Duration',
                              style: TextStyleInventory.regBold
                                  .copyWith(fontSize: 20)),
                          EmptyBox.verticalSpaceMedium,
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Expanded(
                              child: InputDecorator(
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                )),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value:
                                        appointmentsViewModel.selectedDuration,
                                    hint: const Text('Select Duration'),
                                    isExpanded: true,
                                    isDense: true,
                                    onChanged: (String? newValue) {
                                      Provider.of<AppointmentsViewModel>(
                                              context,
                                              listen: false)
                                          .setSelectedDuration(newValue);
                                    },
                                    items: appointmentsViewModel
                                        .appointmentOption?.duration
                                        ?.map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Row(
                                          children: [
                                            Icon(Icons.access_time,
                                                color: Colors.blue.shade700),
                                            EmptyBox.horizontalSpaceTiny,
                                            Text(value,
                                                style:
                                                    TextStyleInventory.regBold),
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
                              style: TextStyleInventory.regBold
                                  .copyWith(fontSize: 20)),
                          EmptyBox.verticalSpaceMedium,
                          Column(
                            children: appointmentsViewModel
                                .appointmentOption?.package
                                ?.map((String key) {
                              return PackageRowItemWidget(
                                title: key,
                                value: packagesDescriptions[key] ?? '',
                                iconData: packagesWithIcon[key],
                                trailing: Radio<String>(
                                  value: key,
                                  groupValue:
                                      appointmentsViewModel.selectedPackage,
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
                        if (Provider.of<AppointmentsViewModel>(context,
                                    listen: false)
                                .selectedDuration ==
                            null) {
                          // show toast
                          ToastNotifiers.showToast(msg: 'Duration not selected');
                          return;
                        }
                        if (Provider.of<AppointmentsViewModel>(context,
                                    listen: false)
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
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class PackageRowItemWidget extends StatelessWidget {
  final String title;
  final String value;
  final IconData? iconData;
  final Widget trailing;

  const PackageRowItemWidget({
    this.title = '',
    this.value = '',
    this.iconData,
    this.trailing = const SizedBox(),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueGrey.shade100, width: 1.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 30,
            child: Icon(
              iconData,
              size: 25,
              color: Colors.blue.shade700,
            ),
          ),
          EmptyBox.horizontalSpaceSmall,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyleInventory.regBold),
              Text(
                value,
              ),
            ],
          ),
          Spacer(),
          trailing,
        ],
      ),
    );
  }
}
