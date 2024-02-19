import 'package:flutter/material.dart';
import 'package:github_test/src/data/models/github_commits.dart';
import 'package:github_test/src/ui/global_widgets/default_loading.dart';
import 'package:github_test/src/ui/pages/commits/commits_page_controller.dart';
import 'package:github_test/src/ui/pages/commits/widgets/commit_details_card.dart';
import 'package:github_test/src/ui/pages/commits/widgets/empty_commits_message.dart';
import 'package:provider/provider.dart';

class CommitsPageContent extends StatefulWidget {
  const CommitsPageContent({
    super.key,
    required this.repoName,
  });

  final String repoName;

  @override
  State<CommitsPageContent> createState() => _CommitsPageContentState();
}

class _CommitsPageContentState extends State<CommitsPageContent> {
  @override
  void initState() {
    super.initState();
    getCommits();
  }

  void getCommits() {
    final controller = Provider.of<CommitsPageController>(
      context,
      listen: false,
    );

    controller.fetchCommits(
      repoName: widget.repoName,
    );
  }

  @override
  Widget build(BuildContext context) {
    final commitsList =
        context.select<CommitsPageController, List<GitHubCommit>?>(
      (c) => c.commitsList,
    );

    final controller = Provider.of<CommitsPageController>(
      context,
      listen: false,
    );

    if (commitsList == null) {
      return const DefaultLoading();
    } else {
      return RefreshIndicator(
        onRefresh: () => controller.refreshfetchCommits(
          repoName: widget.repoName,
        ),
        child: commitsList.isEmpty
            ? const EmptyCommitsMessage()
            : ListView.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                itemBuilder: (context, index) {
                  final commit = commitsList[index];

                  return CommitDetailsCard(
                    commitData: commit,
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 12,
                ),
                itemCount: commitsList.length,
              ),
      );
    }
  }
}
