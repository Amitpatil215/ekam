import 'package:ekam/ViewModels/appointments_viewmodel.dart';
import 'package:ekam/ViewModels/bookings_viewmodel.dart';
import 'package:ekam/ViewModels/doc_details_viewmodel.dart';
import 'package:ekam/Views/doc_list_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/font.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  static const String id = "SplashView";

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // wait for 2 sec and navigate to doc details screen
    Provider.of<DocDetailsViewModel>(context, listen: false).getDoctors();
    Provider.of<AppointmentsViewModel>(context, listen: false)
        .getAppointmentOptions();
    Provider.of<BookingsViewModel>(context, listen: false)
        .getBookingsFromRemote();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushNamed(context, DocListView.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.zero,
                  child: Image(
                    height: 62,
                    width: 204,
                    image: AssetImage("assets/images/logo.png"),
                  ),
                ),
                Text(
                  "Transform Thrive with Ekam",
                  style: TextStyle(
                    fontFamily: kTextFont,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
