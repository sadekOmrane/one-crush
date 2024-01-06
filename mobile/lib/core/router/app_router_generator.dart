import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/injection/dependency_injection.dart';
import 'package:mobile/core/router/app_routes.dart';
import 'package:mobile/features/auth/presentation/blocs/remote/login/login_bloc.dart';
import 'package:mobile/features/auth/presentation/blocs/remote/register/register_bloc.dart';
import 'package:mobile/features/auth/presentation/pages/login_page.dart';
import 'package:mobile/features/auth/presentation/pages/register_page.dart';
import 'package:mobile/features/home/presentation/blocs/remote/get_users/get_users_bloc.dart';
import 'package:mobile/features/home/presentation/pages/home_page.dart';

class AppRouterGenerator {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.APP_LOGIN_SCREEN:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => sl<LoginBloc>(),
                  child: LoginPage(),
                ));
      case AppRoutes.APP_REGISTER_SCREEN:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => sl<RegisterBloc>(),
                  child: RegisterPage(),
                ));
      case AppRoutes.APP_HOME_SCREEN:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => sl<GetUsersBloc>(),
                  child: HomePages(),
                ));
      default:
        return CupertinoPageRoute(
          builder: (_) => Scaffold(
            body: Center(
                child: Text(
              'No route defined for ${settings.name}',
            )),
          ),
        );
    }
  }
}
