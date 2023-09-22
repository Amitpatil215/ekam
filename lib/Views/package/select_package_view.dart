import 'package:ekam/ViewModels/appointments_viewmodel.dart';
import 'package:ekam/Views/package/duration_package_picker_widget.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectPackageView extends StatefulWidget {
  static const String id = "SelectPackageView";
  const SelectPackageView({Key? key}) : super(key: key);

  @override
  State<SelectPackageView> createState() => _SelectPackageViewState();
}

class _SelectPackageViewState extends State<SelectPackageView> {
  @override
  void initState() {
    Provider.of<AppointmentsViewModel>(context, listen: false)
        .getAppointmentOptions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Provider.of<AppointmentsViewModel>(context, listen: false)
            .resetPackageAndDuration();
        return Future(() => true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Select Package'),
          centerTitle: true,
        ),
        body: const Padding(
          padding: EdgeInsets.all(20.0),
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: DurationAndPakcage(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
