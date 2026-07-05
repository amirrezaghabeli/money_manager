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
          margin: EdgeInsets.symmetric(horizontal: context.w(16)),
          decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [const BoxShadow(color: AppColors.onSurfaceColor)],
          ),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('BALANCE', style: TextStyle(fontSize: context.sp(16))),
                  Row(
                    children: [
                      Text(
                        '2400',
                        style: TextStyle(
                          fontSize: context.sp(16),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '\$',
                        style: TextStyle(
                          fontSize: context.sp(16),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        _pieChart(),
      ],
    );
  }

  AspectRatio _pieChart() {
    const textStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: AppColors.backgroundColor,
    );
    return AspectRatio(
      aspectRatio: 1.0,
      child: Container(
        // color: Colors.blue,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: PieChart(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
