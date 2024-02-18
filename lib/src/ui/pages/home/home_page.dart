import 'package:flutter/material.dart';
import 'package:github_test/src/data/models/github_profile.dart';
import 'package:github_test/src/data/providers/github_profile_provider.dart';
import 'package:github_test/src/ui/global_widgets/api_error_mesage.dart';
import 'package:github_test/src/ui/global_widgets/default_loading.dart';
import 'package:github_test/src/ui/pages/home/widgets/profile_card.dart';
import 'package:github_test/src/ui/pages/home/widgets/view_repositories_button.dart';
import 'package:github_test/src/utils/constants.dart';
import 'package:github_test/src/utils/font_styles.dart';
import 'package:github_test/src/utils/responsive.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Column(
            children: [
              Text(
                'Mi perfil de GitHub',
                style: FontStyles.title,
              ),
              SizedBox(
                height: responsive.dp(2),
              ),
              FutureBuilder<GitHubProfile?>(
                future: GitHubProfileProvider().fetchGitHubProfile(githubUser),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final gitHubProfile = snapshot.data!;

                    return ProfileCard(
                      gitHubProfile: gitHubProfile,
                    );
                  } else if (snapshot.hasError) {
                    return const ApiErrorMessage(
                      message:
                          'Ocurrió un error al obtener la informacion de tu perfil de GitHub.',
                    );
                  } else {
                    return const DefaultLoading();
                  }
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const ViewRepositoriesButton(),
    );
  }
}
