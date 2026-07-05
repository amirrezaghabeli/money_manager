import 'package:flutter/material.dart';
import 'package:money_manager/ui/core/constants/app_strings.dart';
import 'package:money_manager/ui/core/theme/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.backgroundColor,
        title: Text(
          AppString.appName,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.onSurfaceColor,
          ),
        ),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Column(children: [
        
      ],
    );
  }
}
