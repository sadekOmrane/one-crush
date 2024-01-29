import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/injection/dependency_injection.dart';
import 'package:mobile/core/router/app_routes.dart';
import 'package:mobile/features/account/presentation/blocs/remote/account/account_bloc.dart';
import 'package:mobile/features/account/presentation/pages/account_page.dart';
import 'package:mobile/features/auth/presentation/pages/login_page.dart';
import 'package:mobile/features/auth/presentation/pages/register_page.dart';
import 'package:mobile/features/home/presentation/blocs/remote/get_suggestions/get_suggestions_bloc.dart';
import 'package:mobile/features/home/presentation/blocs/remote/matching/matching_bloc.dart';
import 'package:mobile/features/home/presentation/pages/home_page.dart';

class AppRouterGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.APP_LOGIN_SCREEN:
        return MaterialPageRoute(
          builder: (_) => LoginPage(),
        );
      case AppRoutes.APP_REGISTER_SCREEN:
        return MaterialPageRoute(
          builder: (_) => RegisterPage(),
        );
      case AppRoutes.APP_HOME_SCREEN:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => sl<GetSuggestionsBloc>(),
              ),
              BlocProvider(
                create: (context) => sl<MatchingBloc>(),
              ),
            ],
            child: HomePages(),
          ),
        );
      case AppRoutes.APP_ACCOUNT_SCREEN:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => sl<AccountBloc>(),
            child: AccountPage(),
          ),
        );
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
