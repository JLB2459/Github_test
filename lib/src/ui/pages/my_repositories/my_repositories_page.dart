import 'package:flutter/material.dart';
import 'package:github_test/src/data/models/github_repository.dart';
import 'package:github_test/src/data/providers/github_repositories_provider.dart';
import 'package:github_test/src/ui/global_widgets/api_error_mesage.dart';
import 'package:github_test/src/ui/global_widgets/default_loading.dart';
import 'package:github_test/src/ui/pages/commits/commits_page.dart';
import 'package:github_test/src/ui/pages/my_repositories/widgets/my_repository_card.dart';
import 'package:github_test/src/utils/constants.dart';
import 'package:github_test/src/utils/font_styles.dart';

class MyRepositoriesPage extends StatelessWidget {
  const MyRepositoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mis Repositorios',
          style: FontStyles.title,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: FutureBuilder<List<GitHubRepository>?>(
          future:
              GitHubRepositoriesProvider().fetchGitHubRepositories(githubUser),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final repositories = snapshot.data!;

              return ListView.separated(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                itemBuilder: (context, index) {
                  final repository = repositories[index];

                  return MyRepositoryCard(
                    repository: repository,
                    onPressed: () {
                      final repoName = repository.name;

                      Navigator.push(context, _createRoute(repoName));
                    },
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 12,
                ),
                itemCount: repositories.length,
              );
            } else if (snapshot.hasError) {
              return const ApiErrorMessage(
                message:
                    'Ocurrió un error al obtener información de los repositorios',
              );
            } else {
              return const DefaultLoading();
            }
          },
        ),
      ),
    );
  }
}

Route _createRoute(String repoName) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const CommitsPage(),
    transitionDuration: const Duration(milliseconds: 600),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOutQuad;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
    settings: RouteSettings(
      arguments: repoName,
    ),
  );
}
