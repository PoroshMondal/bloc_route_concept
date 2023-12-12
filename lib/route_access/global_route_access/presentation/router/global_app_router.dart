import 'package:flutter/material.dart';

import '../screens/global_home_screen.dart';
import '../screens/global_second_screen.dart';
import '../screens/global_third_screen.dart';

class GlobalAppRouter {
  MaterialPageRoute? onGeneratedRoute(RouteSettings routeSettings) {
    switch(routeSettings.name){
      case '/':
        return MaterialPageRoute(
            builder: (_) => const GlobalHomeScreen(
              title: "Global Home Screen",
              color: Colors.blueAccent,
            )
        );
      case '/second':
        return MaterialPageRoute(
            builder: (_) => const GlobalSecondScreen(
              title: "Global Second Screen",
              color: Colors.blueAccent,
            )
        );
      case '/third':
        return MaterialPageRoute(
            builder: (_) => const GlobalThirdScreen(
              title: "Global Third Screen",
              color: Colors.blueAccent,
            )
        );
      default:
        null;
    }
    return null;
  }

}

