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
import 'package:mobile/features/auth/presentation/blocs/remote/login/login_bloc.dart';
import 'package:mobile/features/auth/presentation/widgets/app_logo_widget.dart';
import 'package:mobile/features/auth/presentation/widgets/app_social_login_button_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showPassword = false;
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
                  _buildLoginForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginForm() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 40.sp),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildLoginFormHeader(),
          SizedBox(
            height: 20.sp,
          ),
          _buildLoginFormBody(),
          SizedBox(
            height: 20.sp,
          ),
          _buildLoginFormFooter(),
        ],
      ),
    );
  }

  Widget _buildLoginFormHeader() {
    return Column(
      children: [
        Text("Login", style: AppTextStyle.primaryTextblack22Bold),
        SizedBox(height: 10.sp),
        Text("Welcome Back !", style: AppTextStyle.secondaryText14Regular),
      ],
    );
  }

  Widget _buildLoginFormBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
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
                    )),
        ),
        SizedBox(
          height: 10.sp,
        ),
        AppPrimaryButtonWidget(
          label: 'Login',
          onPress: () {
            BlocProvider.of<LoginBloc>(context).add(
              Login(
                email: emailController.text,
                password: passwordController.text,
              ),
            );
          },
        ),
        SizedBox(
          height: 10.sp,
        ),
        BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LogedIn) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/client/home', (route) => false);
            }
          },
          builder: (context, state) {
            if (state is LoginLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is LoginError) {
              return AppMessageErrorWidget(error: state.error);
            }

            return SizedBox();
          },
        ),
      ],
    );
  }

  Widget _buildLoginFormFooter() {
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
                Navigator.pushNamed(context, AppRoutes.APP_REGISTER_SCREEN);
              },
              child: Text(
                'Register',
                style: AppTextStyle.primaryTextBlack14Regular
                    .copyWith(color: AppColors.primary),
              ),
            )
          ],
        )
      ],
    );
  }
}
