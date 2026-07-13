import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/constants/app_colors.dart';

class MainTextField extends StatelessWidget {
  const MainTextField({
    required this.hintText,
    required this.controller,
    this.prefixIcon,
    super.key,
  });

  final TextEditingController controller;
  final String hintText;
  final String? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hint: Text(
          hintText,
          style: TextStyle(
            fontSize: context.sp(14),
            fontWeight: FontWeight.w400,
            color: AppColors.onSurfaceColor,
          ),
        ),

        contentPadding: EdgeInsets.symmetric(horizontal: context.w(16)),
        prefixIconConstraints: const BoxConstraints(),
        prefixIcon: prefixIcon != null
            ? Padding(
                padding: EdgeInsetsDirectional.only(start: context.w(10)),
                child: SizedBox(
                  width: context.w(16),
                  height: context.w(16),
                  child: Center(
                    child: SvgPicture.asset(
                      prefixIcon!,
                      colorFilter: const ColorFilter.mode(
                        AppColors.onSurfaceColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              )
            : null,
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.hintColor),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.hintColor),
        ),
      ),
    );
  }
}
