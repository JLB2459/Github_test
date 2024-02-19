import 'package:flutter/foundation.dart';
import 'package:github_test/src/data/models/github_commits.dart';
import 'package:github_test/src/data/providers/github_commits_provider.dart';
import 'package:github_test/src/utils/constants.dart';

class CommitsPageController extends ChangeNotifier {
  List<GitHubCommit>? _commitsList;
  List<GitHubCommit>? get commitsList => _commitsList;

  Future<List<GitHubCommit>?> fetchCommits({required String repoName}) async {
    final commitsListResponse = await GitHubCommitsProvider().fetchCommits(
      repoName,
      githubUser,
    );

    if (commitsListResponse != null) {
      _commitsList = commitsListResponse;
      notifyListeners();
    }

    return null;
  }

  Future<List<GitHubCommit>?> refreshfetchCommits(
      {required String repoName}) async {
    _commitsList = null;
    notifyListeners();

    final commitsListResponse = await GitHubCommitsProvider().fetchCommits(
      repoName,
      githubUser,
    );

    if (commitsListResponse != null) {
      _commitsList = commitsListResponse;
      notifyListeners();
    }

    return null;
  }
}
