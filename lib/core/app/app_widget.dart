import 'package:flutter/material.dart';
import 'package:flutter_exemplo_bloquear_captura/core/routes/app_routes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Exemplo Bloquear Captura',
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.home,
    );
  }
}
