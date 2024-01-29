import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:mobile/core/router/app_routes.dart';
import 'package:mobile/core/styles/app_colors.dart';
import 'package:mobile/core/styles/app_global.dart';
import 'package:mobile/core/styles/app_text_style.dart';
import 'package:mobile/core/widgets/app_input_widget.dart';
import 'package:mobile/core/widgets/app_message_error_widget.dart';
import 'package:mobile/core/widgets/app_primary_button_widget.dart';
import 'package:mobile/features/auth/presentation/blocs/remote/auth/auth_bloc.dart';
import 'package:mobile/features/auth/presentation/widgets/app_logo_widget.dart';
import 'package:mobile/features/auth/presentation/widgets/app_social_login_button_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool showPassword = false;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
            gradient: AppGlobal.bgGradient,
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(30.sp),
              child: Column(
                children: [
                  AppLogoWidget(),
                  _buildRegisterForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRegisterForm() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 40.sp),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildRegisterFormHeader(),
          SizedBox(
            height: 20.sp,
          ),
          _buildRegisterFormBody(),
          SizedBox(
            height: 20.sp,
          ),
          _buildRegisterFormFooter(),
        ],
      ),
    );
  }

  Widget _buildRegisterFormHeader() {
    return Column(
      children: [
        Text("Get Started", style: AppTextStyle.primaryTextblack22Bold),
        SizedBox(height: 10.sp),
        Text(
          "Let's get started by filling out the form below.",
          style: AppTextStyle.secondaryText14Regular,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildRegisterFormFooter() {
    return Column(
      children: [
        Text(
          'Or continue with :',
          style: AppTextStyle.secondaryText14Regular,
        ),
        SizedBox(
          height: 20.sp,
        ),
        AppSocialLoginWidget(
          label: 'Continue with Google',
          icon: Icon(
            Bootstrap.google,
            size: 16.sp,
            color: AppColors.primaryText,
          ),
        ),
        SizedBox(
          height: 5.sp,
        ),
        AppSocialLoginWidget(
          label: 'Continue with Apple',
          icon: Icon(
            Bootstrap.apple,
            size: 16.sp,
            color: AppColors.primaryText,
          ),
        ),
        SizedBox(
          height: 20.sp,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Don\'t have account?',
              style: AppTextStyle.primaryTextBlack12Regular,
            ),
            SizedBox(
              width: 5.sp,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.APP_LOGIN_SCREEN);
              },
              child: Text(
                'Login',
                style: AppTextStyle.primaryTextBlack14Regular
                    .copyWith(color: AppColors.primary),
              ),
            )
          ],
        )
      ],
    );
  }

  Widget _buildRegisterFormBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppInputWidget(
          label: 'Full Name',
          controller: nameController,
        ),
        SizedBox(
          height: 10.sp,
        ),
        AppInputWidget(
          label: 'Email',
          controller: emailController,
          prefixIcon: Icon(
            Bootstrap.envelope,
            size: 18.sp,
          ),
        ),
        SizedBox(
          height: 10.sp,
        ),
        AppInputWidget(
          obscureText: showPassword,
          controller: passwordController,
          label: 'Password',
          prefixIcon: Icon(
            Bootstrap.lock,
            size: 18.sp,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                showPassword = !showPassword;
              });
            },
            icon: showPassword
                ? Icon(
                    Bootstrap.eye_slash,
                    size: 18.sp,
                  )
                : Icon(
                    Bootstrap.eye,
                    size: 18.sp,
                  ),
          ),
        ),
        SizedBox(
          height: 10.sp,
        ),
        AppPrimaryButtonWidget(
          label: 'Login',
          onPress: () {
            BlocProvider.of<AuthBloc>(context).add(
              Register(
                name: nameController.text,
                email: emailController.text,
                password: passwordController.text,
              ),
            );
          },
        ),
        SizedBox(
          height: 10.sp,
        ),
        BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is LogedIn) {
              Navigator.pushNamedAndRemoveUntil(
                  context, AppRoutes.APP_HOME_SCREEN, (route) => false);
            }
          },
          builder: (context, state) {
            if (state is RegisterLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is RegisterError) {
              return AppMessageErrorWidget(error: state.error);
            }

            return SizedBox();
          },
        ),
      ],
    );
  }
}
