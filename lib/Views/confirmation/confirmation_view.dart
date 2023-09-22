import 'package:ekam/ViewModels/appointments_viewmodel.dart';
import 'package:ekam/Views/booking/booking_view.dart';
import 'package:ekam/Views/confirmation/info_tile_widget.dart';
import 'package:ekam/Views/doc_detail/doc_details_view.dart';
import 'package:ekam/Views/doc_list_view.dart';
import 'package:ekam/Views/package/select_package_view.dart';
import 'package:ekam/components/buttons.dart';
import 'package:ekam/components/empty_boxes.dart';
import 'package:ekam/constants/textStyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfirmationView extends StatefulWidget {
  static const String id = "ConfirmationView";

  const ConfirmationView({Key? key}) : super(key: key);

  @override
  State<ConfirmationView> createState() => _ConfirmationViewState();
}

class _ConfirmationViewState extends State<ConfirmationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirmation'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: WillPopScope(
        onWillPop: () {
          return Future(() => false);
        },
        child: Center(
            child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Consumer<AppointmentsViewModel>(
                  builder: (context, appointmentsViewModel, _) {
                return Column(
                  children: <Widget>[
                    Expanded(
                        child: Column(
                      children: <Widget>[
                        const SizedBox(height: 50),
                        const CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.blue,
                          child:
                              Icon(Icons.check, size: 50, color: Colors.white),
                        ),
                        const SizedBox(height: 20),
                        const Text('Appointment Confirmed',
                            style: TextStyleInventory.regBold),
                        EmptyBox.verticalSpaceMedium,
                        const Text(
                            "You have successfully booked appointment with",
                            style: TextStyleInventory.reg,
                            textAlign: TextAlign.center),
                        Text(appointmentsViewModel.selectedDoctor!.doctorName,
                            style: TextStyleInventory.regBold,
                            textAlign: TextAlign.center),
                        EmptyBox.verticalSpaceMedium,
                        const Divider(
                          indent: 20,
                          endIndent: 20,
                          thickness: 0.5,
                        ),
                        EmptyBox.verticalSpaceMedium,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              QuickTileInfo(
                                  title: appointmentsViewModel
                                      .selectedDoctor!.doctorName,
                                  icon: CupertinoIcons.person_fill),
                            ],
                          ),
                        ),
                        EmptyBox.verticalSpaceMedium,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              QuickTileInfo(
                                  title:
                                      appointmentsViewModel.selectedDate ?? "",
                                  icon: CupertinoIcons.calendar),
                              QuickTileInfo(
                                  title:
                                      appointmentsViewModel.selectedTime ?? "",
                                  icon: CupertinoIcons.clock_fill),
                            ],
                          ),
                        ),
                      ],
                    )),
                    HorizontalFullWidthButton(
                      text: 'View Appointments',
                      onPressed: () {
                        Provider.of<AppointmentsViewModel>(context,
                            listen: false)
                          ..resetTimeAndDate()
                          ..resetPackageAndDuration();
                        Navigator.pushNamed(context, MyBookingView.id);
                      },
                    ),
                    EmptyBox.verticalSpaceSmall,
                    TextButton(
                      onPressed: () {
                        Provider.of<AppointmentsViewModel>(context,
                            listen: false)
                          ..resetTimeAndDate()
                          ..resetPackageAndDuration();
                        Navigator.pushNamedAndRemoveUntil(
                            context, DocListView.id, (route) => false);
                      },
                      child: const Text(
                        "Book Another",
                        style: TextStyleInventory.regBold,
                      ),
                    ),
                    EmptyBox.verticalSpaceMedium
                  ],
                );
              }),
            ),
          ],
        )),
      ),
    );
  }
}
