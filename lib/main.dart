import 'package:ekam/ViewModels/bookings_viewmodel.dart';
import 'package:ekam/ViewModels/doc_details_viewmodel.dart';
import 'package:ekam/Views/booking/booking_view.dart';
import 'package:ekam/Views/confirmation/confirmation_view.dart';
import 'package:ekam/Views/doc_detail/doc_details_view.dart';
import 'package:ekam/Views/doc_list_view.dart';
import 'package:ekam/Views/review_summary/review_summary_view.dart';
import 'package:ekam/Views/package/select_package_view.dart';
import 'package:ekam/Views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:screen_size_test/screen_size_test.dart';

import 'ViewModels/appointments_viewmodel.dart';
import 'constants/font.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      /// Providers are used to store the state of the app
      providers: [
        /// This provider is used to store the state of the appointments screen
        ChangeNotifierProvider(create: (_) => AppointmentsViewModel()),
        ///  This provider is used to store the state of the doc details screen
        ChangeNotifierProvider(create: (_) => DocDetailsViewModel()),
        /// This provider is used to store the state of the bookings screen
        ChangeNotifierProvider(create: (_) => BookingsViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ekam',
        builder: true
            ? null

            /// This widget is used to test the responsiveness of the app
            /// It is used to test the app on different screen sizes
            /// It is used only in the debug mode
            /// To enable it, set the value of builder to true
            /// To disable it, set the value of builder to false
            : (context, child) => ScreenSizeTest(
                  child: child,
                ),
        theme: ThemeData(
          fontFamily: kTextFont,
          useMaterial3: true,
        ),
        home: const SplashView(),
        routes: {
          SplashView.id: (context) => const SplashView(),
          DocDetailsView.id: (context) => DocDetailsView(
                docName: ModalRoute.of(context)?.settings.arguments as String,
              ),
          SelectPackageView.id: (context) => const SelectPackageView(),
          ReviewSummaryView.id: (context) => const ReviewSummaryView(),
          ConfirmationView.id: (context) => const ConfirmationView(),
          MyBookingView.id: (context) => const MyBookingView(),
          DocListView.id: (context) => const DocListView(),
        },

        /// This method is used to handle the navigation to the unknown routes
        onUnknownRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) => const SplashView(),
          );
        },
        initialRoute: SplashView.id,
      ),
    );
  }
}
