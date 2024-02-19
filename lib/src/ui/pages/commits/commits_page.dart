import 'package:flutter/material.dart';
import 'package:github_test/src/ui/pages/commits/commits_page_controller.dart';
import 'package:github_test/src/ui/pages/commits/widgets/commits_page_content.dart';
import 'package:github_test/src/ui/pages/commits/widgets/info_button.dart';
import 'package:github_test/src/ui/pages/commits/widgets/view_project_button.dart';
import 'package:github_test/src/utils/font_styles.dart';
import 'package:provider/provider.dart';

class CommitsPage extends StatelessWidget {
  const CommitsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final repoData =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    return ChangeNotifierProvider(
      create: (_) => CommitsPageController(),
      builder: (_, __) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Commits de ${repoData['repoName']}',
              style: FontStyles.title,
            ),
            centerTitle: true,
            actions: const [
              InfoButton(),
            ],
          ),
          body: SafeArea(
            child: CommitsPageContent(
              repoName: repoData['repoName']!,
            ),
          ),
          bottomNavigationBar: ViewProjectButton(
            url: repoData['url']!,
          ),
        );
      },
    );
  }
}
