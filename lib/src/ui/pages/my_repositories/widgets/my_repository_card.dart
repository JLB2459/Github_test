import 'package:flutter/cupertino.dart' show CupertinoButton;
import 'package:flutter/material.dart';
import 'package:github_test/src/data/models/github_repository.dart';
import 'package:github_test/src/ui/global_widgets/avatar.dart';
import 'package:github_test/src/ui/pages/my_repositories/widgets/respository_info.dart';
import 'package:github_test/src/utils/app_colors.dart';
import 'package:github_test/src/utils/font_styles.dart';
import 'package:github_test/src/utils/responsive.dart';
import 'package:intl/intl.dart';

class MyRepositoryCard extends StatelessWidget {
  const MyRepositoryCard({
    super.key,
    required this.repository,
    this.onPressed,
  });

  final GitHubRepository repository;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    final owner = repository.owner;

    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 20,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.grey,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Avatar(
                  size: 45,
                  asset: owner.avatarUrl,
                ),
                SizedBox(
                  width: responsive.dp(1.2),
                ),
                Flexible(
                  child: Text(
                    repository.fullName,
                    style: FontStyles.title2.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: responsive.dp(0.9),
            ),
            Text(
              repository.name,
              style: FontStyles.title2.copyWith(
                fontSize: 16,
              ),
            ),
            if (repository.description != null)
              Text(
                repository.description!,
                style: FontStyles.normal.copyWith(
                  fontSize: 14,
                ),
              ),
            SizedBox(
              height: responsive.dp(1.2),
            ),
            if (repository.language != null) ...[
              RepositoryInfo(
                title: 'Lenguaje',
                info: repository.language!,
              ),
              SizedBox(
                height: responsive.dp(0.3),
              ),
            ],
            RepositoryInfo(
              isGreen: true,
              title: 'Disponible desde',
              info: DateFormat.yMMMd('ES').format(repository.createdAt),
            ),
          ],
        ),
      ),
    );
  }
}
