import 'package:doctor_app/pages/auth/auth_complete_view.dart';
import 'package:doctor_app/pages/create/account_create_view.dart';
import 'package:doctor_app/pages/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Routes {
  Routes._();

  //auth
  static const String login = "/login";
  static const String accountCreate = "/account-create";
  static const String authComplete = "/auth-complete";

}

class RouteGenerator {
  final RouteSettings settings;

  RouteGenerator({required this.settings});

  Route<dynamic> getRoute() {

    switch (settings.name) {
      case Routes.login:
        return getTransistionPage(const LoginView());

      case Routes.accountCreate:
        return getTransistionPage(const AccountCreateView());
        
      case Routes.authComplete:
        return getTransistionPage(const AuthCompleteView());

      default:
        return unDefinedRoute();
    }
  }

  getTransistionPage(Widget child) {
    return PageTransition(
      child: child,
      settings: settings,
      type: PageTransitionType.fade,
    );
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(
          child: Text('Not Found'),
        ),
      ),
    );
  }
}
