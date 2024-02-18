import 'package:flutter/material.dart';
import 'package:github_test/src/data/models/github_profile.dart';
import 'package:github_test/src/ui/global_widgets/avatar.dart';
import 'package:github_test/src/ui/pages/home/widgets/personal_info.dart';
import 'package:github_test/src/ui/pages/home/widgets/profile_info.dart';
import 'package:github_test/src/utils/font_styles.dart';
import 'package:github_test/src/utils/responsive.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    required this.gitHubProfile,
  });

  final GitHubProfile gitHubProfile;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);

    return Card(
      margin: EdgeInsets.only(
        bottom: responsive.dp(1.2),
      ),
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Avatar(
                  size: 60,
                  asset: gitHubProfile.avatarUrl,
                ),
                SizedBox(
                  width: responsive.dp(2),
                ),
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        gitHubProfile.name,
                        style: FontStyles.title2,
                      ),
                      SizedBox(
                        height: responsive.dp(0.4),
                      ),
                      Text(
                        gitHubProfile.login,
                        style: FontStyles.title2.copyWith(fontSize: 15),
                      ),
                      SizedBox(
                        height: responsive.dp(0.9),
                      ),
                      PersonalInfo(
                        title: 'Correo:',
                        info: gitHubProfile.email,
                      ),
                      SizedBox(
                        height: responsive.dp(0.2),
                      ),
                      PersonalInfo(
                        title: 'Locación:',
                        info: gitHubProfile.location,
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: responsive.dp(2),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ProfileInfo(
                  title: 'Repositorios',
                  info: gitHubProfile.publicRepos.toString(),
                ),
                ProfileInfo(
                  title: 'Following',
                  info: gitHubProfile.following.toString(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
