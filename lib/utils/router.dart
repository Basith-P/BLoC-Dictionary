import 'package:flutter/material.dart';

import '../models/word_details.dart';
import '../views/home_page.dart';
import '../views/result_list_page.dart';
import '../views/word_details_page.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const MainPage());
      case ResultListPage.routeName:
        return MaterialPageRoute(
            builder: (_) =>
                ResultListPage(settings.arguments as List<WordDetails>));
      case WordDetailsPage.routeName:
        return MaterialPageRoute(
            builder: (_) => WordDetailsPage(settings.arguments as WordDetails));
      default:
        return MaterialPageRoute(builder: (_) => const MainPage());
    }
  }
}
