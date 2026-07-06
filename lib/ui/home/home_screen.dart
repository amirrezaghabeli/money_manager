import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:money_manager/ui/core/constants/app_strings.dart';
import 'package:money_manager/ui/core/theme/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: _appBar(context),
      body: _body(context),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: AppColors.backgroundColor,
      title: Text(
        AppString.appName,
        style: TextStyle(
          fontSize: context.sp(14),
          fontWeight: FontWeight.w400,
          color: AppColors.onSurfaceColor,
        ),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(
            horizontal: context.w(16),
            vertical: context.h(16),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: context.w(16),
            vertical: context.h(16),
          ),
          decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: AppColors.onSurfaceColor.withValues(alpha: 0.4),
                blurRadius: 2,
              ),
            ],
          ),
          child: _pieChart(context),
        ),
      ],
    );
  }

  Widget _pieChart(BuildContext context) {
    final textStyle = TextStyle(
      fontSize: context.sp(12),
      fontWeight: FontWeight.bold,
      color: AppColors.backgroundColor,
    );
    return SizedBox(
      // color: Colors.blue,
      width: context.w(220),
      height: context.w(220),

      child: Stack(
        children: [
          PieChart(
            PieChartData(
              sections: [
                PieChartSectionData(
                  value: 10,
                  color: Colors.blue,
                  titleStyle: textStyle,
                ),
                PieChartSectionData(
                  value: 20,
                  color: Colors.amber,
                  titleStyle: textStyle,
                ),
                PieChartSectionData(
                  value: 30,
                  color: Colors.pink,
                  titleStyle: textStyle,
                ),
                PieChartSectionData(
                  value: 40,
                  color: Colors.green,
                  titleStyle: textStyle,
                ),
                PieChartSectionData(
                  value: 50,
                  color: Colors.red,
                  titleStyle: textStyle,
                  radius: 50,
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '2400',
                    style: TextStyle(
                      fontSize: context.sp(20),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(width: context.w(6)),
                  Text(
                    '\$',
                    style: TextStyle(
                      fontSize: context.sp(20),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
