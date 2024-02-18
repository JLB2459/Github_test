import 'package:flutter/material.dart';
import 'package:github_test/src/routes/routes/routes.dart';
import 'package:github_test/src/ui/pages/home/home_page.dart';
import 'package:github_test/src/ui/pages/my_repositories/my_repositories_page.dart';

Map<String, Widget Function(BuildContext)> get appRoutes {
  return {
    Routes.home: (_) => const HomePage(),
    Routes.myRepositories: (_) => const MyRepositoriesPage(),
  };
}
