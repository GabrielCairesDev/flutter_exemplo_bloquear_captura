import 'package:flutter/material.dart';
import 'package:flutter_exemplo_bloquear_captura/presentation/home/view/home_view.dart';

class AppRoutes {
  static const String home = '/';

  static Map<String, WidgetBuilder> get routes => {
    home: (context) {
      return const HomeView();
    },
  };
}
