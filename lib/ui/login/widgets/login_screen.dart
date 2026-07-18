import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:money_manager/config/injection.dart';
import 'package:money_manager/core/constants/app_colors.dart';
import 'package:money_manager/gen/assets.gen.dart';
import 'package:money_manager/ui/home/home_screen.dart';
import 'package:money_manager/ui/login/bloc/login_bloc.dart';
import 'package:money_manager/ui/shared/main_text_field.dart';
import 'package:money_manager/ui/sign_up/widgets/sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _usernameController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginBloc>(),
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
        _registerRow(context),
        SizedBox(height: context.h(32)),
        _loginButton(context),
      ],
    );
  }

  Widget _signInText(BuildContext context) {
    return Text(
      'Sign in',
      style: TextStyle(
        fontSize: context.sp(24),
        fontWeight: FontWeight.w500,
        color: AppColors.onSurfaceColor,
      ),
    );
  }

  Widget _registerRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Dont have an account?',
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
                builder: (context) => const SignUpScreen(),
              ),
            );
          },
          child: Text(
            'Register Here',
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

  Widget _loginButton(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.loginStatus.isFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('User not found!')));
        }
        if (state.loginStatus.isSuccess) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute<void>(builder: (context) => const HomeScreen()),
          );
        }
      },
      builder: (context, state) {
        if (state.loginStatus.isLoading) {
          return SizedBox(
            width: context.h(46),
            height: context.h(46),
            child: const Center(child: CircularProgressIndicator()),
          );
        }
        return GestureDetector(
          onTap: () {
            context.read<LoginBloc>().add(
              LoginButtonClicked(
                username: _usernameController.text.trim(),
                password: _passwordController.text.trim(),
              ),
            );
          },
          child: Container(
            width: context.w(130),
            height: context.h(46),
            decoration: const BoxDecoration(color: AppColors.primaryColor),
            alignment: Alignment.center,
            child: Text(
              'Login',
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
