import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:github_test/src/data/models/github_commits.dart';
import 'package:github_test/src/utils/constants.dart';

class GitHubCommitsProvider {
  final String _url = 'https://api.github.com/repos/';

  late final Dio _dio;

  GitHubCommitsProvider() {
    _dio = Dio();
  }

  Future<List<GitHubCommit>?> fetchCommits(
    String repoName,
    String gitHubUser,
  ) async {
    try {
      Response response = await _dio.get(
        '$_url$gitHubUser/$repoName/commits',
        options: Options(
          headers: {
            HttpHeaders.acceptHeader: 'application/vnd.github+json',
            HttpHeaders.authorizationHeader: 'Bearer $githubToken',
            'X-GitHub-Api-Version': '2022-11-28',
          },
        ),
      );

      if (response.statusCode == 200) {
        List<GitHubCommit> commitsList = (response.data as List)
            .map((repoJson) => GitHubCommit.fromJson(repoJson))
            .toList();
        return commitsList;
      }
    } on DioException catch (e) {
      log(e.message ?? '');
      log(e.response.toString());
    }

    return null;
  }
}
