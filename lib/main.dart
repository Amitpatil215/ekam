import 'package:ekam/ViewModels/bookings_viewmodel.dart';
import 'package:ekam/ViewModels/doc_details_viewmodel.dart';
import 'package:ekam/Views/booking_view.dart';
import 'package:ekam/Views/confirmation_view.dart';
import 'package:ekam/Views/doc_details_view.dart';
import 'package:ekam/Views/doc_list_view.dart';
import 'package:ekam/Views/review_summary_view.dart';
import 'package:ekam/Views/select_package_view.dart';
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
      providers: [
        ChangeNotifierProvider(create: (_) => AppointmentsViewModel()),
        ChangeNotifierProvider(create: (_) => DocDetailsViewModel()),
        ChangeNotifierProvider(create: (_) => BookingsViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PH Dignostics App',
        builder: true
            ? null
            : (context, child) => ScreenSizeTest(
                  child: child,
                ),
        theme: ThemeData(
          fontFamily: kTextFont,
          // textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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
