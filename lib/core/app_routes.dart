import 'package:flutter/material.dart';
import '../screens/details_screen.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    '/details': (context) => DetailsScreen(),
  };
}
