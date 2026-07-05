import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:money_manager/ui/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const ScreenUtil(
      options: ScreenUtilOptions(
        designSize: Size(360, 780),
        fontFactorByWidth: 2.0,
        fontFactorByHeight: 1.0,
        flipSizeWhenLandscape: true,
      ),
      child: MaterialApp(title: 'Flutter Demo', home: HomeScreen()),
    );
  }
}
