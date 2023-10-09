import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  Future<dynamic> navigateTo(MaterialPageRoute routeName) {
    return navigatorKey.currentState!.push(routeName);
  }
}
