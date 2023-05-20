import 'package:flutter/material.dart';

import 'constants/strings.dart';

import 'presentation/screens/cats_details_screen.dart';
import 'presentation/screens/cats_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings){
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const CatsScreen());
      case catsScreen:
        return MaterialPageRoute(builder: (_) => const CatsScreen());
      case catsDetailsScreen:
        return MaterialPageRoute(builder: (_) => const CatsDetailsScreen());
      // default:
      //   return MaterialPageRoute(builder: (_) => const PageNotFound());
    }
  }
}
