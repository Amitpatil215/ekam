import 'package:ekam/Views/doc_list_view.dart';
import 'package:flutter/material.dart';
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
              children: [
                // Padding(
                //   padding: EdgeInsets.only(top: 180, bottom: 35),
                //   child: Image(
                //     height: 62,
                //     width: 204,
                //     image: AssetImage("images/Logoo.png"),
                //   ),
                // ),
                Text(
                  "Welcome to My App",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF055CA7),
                    fontFamily: "Figtree",
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  "Loading...",
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