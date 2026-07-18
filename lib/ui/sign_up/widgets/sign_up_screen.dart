import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:money_manager/config/injection.dart';
import 'package:money_manager/core/constants/app_colors.dart';
import 'package:money_manager/domain/models/user.dart';
import 'package:money_manager/gen/assets.gen.dart';
import 'package:money_manager/ui/login/widgets/login_screen.dart';
import 'package:money_manager/ui/shared/main_text_field.dart';

import '../bloc/sign_up_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late final TextEditingController _usernameController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;

  @override
  void initState() {
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SignUpBloc>(),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: _body(context),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.w(46)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [const SizedBox(), _form(context), const SizedBox()],
        ),
      ),
    );
  }

  Widget _form(BuildContext context) {
    return Column(
      children: [
        _signInText(context),
        SizedBox(height: context.h(24)),
        MainTextField(
          controller: _usernameController,
          hintText: 'Username',
          prefixIcon: Assets.icons.user,
        ),
        SizedBox(height: context.h(16)),
        MainTextField(
          controller: _passwordController,
          hintText: 'Password',
          prefixIcon: Assets.icons.unlock,
        ),
        SizedBox(height: context.h(16)),
        MainTextField(
          controller: _confirmPasswordController,
          hintText: 'Confirm password',
          prefixIcon: Assets.icons.unlock,
        ),
        SizedBox(height: context.h(16)),
        _signInRow(context),
        SizedBox(height: context.h(32)),
        _signUpButton(),
      ],
    );
  }

  Widget _signInText(BuildContext context) {
    return Text(
      'Sign up',
      style: TextStyle(
        fontSize: context.sp(24),
        fontWeight: FontWeight.w500,
        color: AppColors.onSurfaceColor,
      ),
    );
  }

  Widget _signInRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account?',
          style: TextStyle(
            fontSize: context.sp(12),
            fontWeight: FontWeight.w400,
            color: AppColors.onSurfaceColor,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute<void>(
                builder: (context) => const LoginScreen(),
              ),
            );
          },
          child: Text(
            'Sign in',
            style: TextStyle(
              fontSize: context.sp(12),
              fontWeight: FontWeight.w600,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _signUpButton() {
    return BlocConsumer<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state.signUpStatus.isSuccess) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute<void>(builder: (context) => const LoginScreen()),
          );
        }
      },
      builder: (context, state) {
        if (state.signUpStatus.isLoading) {
          return SizedBox(
            height: context.h(46),
            width: context.h(46),
            child: const Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            ),
          );
        }
        return GestureDetector(
          onTap: () {
            final user = User(
              name: _usernameController.text.trim(),
              password: _passwordController.text.trim(),
            );
            BlocProvider.of<SignUpBloc>(context).add(SignUpClicked(user: user));
          },
          child: Container(
            width: context.w(130),
            height: context.h(46),
            decoration: const BoxDecoration(color: AppColors.primaryColor),
            alignment: Alignment.center,
            child: Text(
              'Sign up',
              style: TextStyle(
                fontSize: context.sp(14),
                fontWeight: FontWeight.w400,
                color: AppColors.onSurfaceColor,
              ),
            ),
          ),
        );
      },
    );
  }
}
