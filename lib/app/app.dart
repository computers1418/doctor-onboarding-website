import 'package:doctor_app/constants/theme_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/app_routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return getMaterialApp('Cardbuk', context);
  }

  getMaterialApp(String title, BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.login,
      onGenerateRoute: (s) => RouteGenerator(settings: s).getRoute(),
      theme: ThemeConst.getApplicationTheme(),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: const TextScaler.linear(1.0)),
          child: child!,
        );
      },
    );
  }
}
