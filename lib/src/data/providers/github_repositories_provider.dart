import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:github_test/src/data/models/github_repository.dart';
import 'package:github_test/src/utils/constants.dart';

class GitHubRepositoriesProvider {
  final String _url = 'https://api.github.com/users/';

  late final Dio _dio;

  GitHubRepositoriesProvider() {
    _dio = Dio();
  }

  Future<List<GitHubRepository>?> fetchGitHubRepositories(
    String gitHubUser,
  ) async {
    try {
      Response response = await _dio.get(
        '$_url$gitHubUser/repos',
        options: Options(
          headers: {
            HttpHeaders.acceptHeader: 'application/vnd.github+json',
            HttpHeaders.authorizationHeader: 'Bearer $githubToken',
            'X-GitHub-Api-Version': '2022-11-28',
          },
        ),
      );

      if (response.statusCode == 200) {
        List<GitHubRepository> gitHubRepositories = (response.data as List)
            .map((repoJson) => GitHubRepository.fromJson(repoJson))
            .toList();

        return gitHubRepositories;
      }
    } on DioException catch (e) {
      log(e.message ?? '');
      log(e.response.toString());
    }

    return null;
  }
}
