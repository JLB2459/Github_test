import 'package:flutter/material.dart';
import 'package:github_test/src/data/models/github_commits.dart';
import 'package:github_test/src/ui/pages/commits/widgets/commit_info.dart';
import 'package:github_test/src/utils/font_styles.dart';
import 'package:github_test/src/utils/responsive.dart';
import 'package:intl/intl.dart';

class CommitDetailsCard extends StatelessWidget {
  const CommitDetailsCard({
    super.key,
    required this.commitData,
  });

  final GitHubCommit commitData;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Icon(
              Icons.commit_rounded,
              color: Colors.grey.shade600,
            ),
            SizedBox(
              width: responsive.dp(0.9),
            ),
            Flexible(
              child: Text(
                'Commit del ${DateFormat.yMMMd('ES').format(commitData.commit.committer.date)}',
                style: FontStyles.normal,
              ),
            ),
          ],
        ),
        SizedBox(
          height: responsive.dp(1.2),
        ),
        Card(
          elevation: 2.0,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 16,
            ),
            child: SizedBox(
              width: responsive.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    commitData.commit.message,
                    style: FontStyles.title2.copyWith(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    height: responsive.dp(0.9),
                  ),
                  CommitInfo(
                    title: 'Autor',
                    info: commitData.commit.author.name,
                  ),
                  CommitInfo(
                    title: 'Email',
                    info: commitData.commit.author.email,
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
