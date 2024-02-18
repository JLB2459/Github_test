import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:github_test/src/data/models/github_profile.dart';
import 'package:github_test/src/utils/constants.dart';

class GitHubProfileProvider {
  final String _url = 'https://api.github.com/users/';

  late final Dio _dio;

  GitHubProfileProvider() {
    _dio = Dio();
  }

  Future<GitHubProfile?> fetchGitHubProfile(String gitHubUser) async {
    try {
      Response response = await _dio.get(
        '$_url$gitHubUser',
        options: Options(
          headers: {
            HttpHeaders.acceptHeader: 'application/vnd.github+json',
            HttpHeaders.authorizationHeader: 'Bearer $githubToken',
            'X-GitHub-Api-Version': '2022-11-28',
          },
        ),
      );

      if (response.statusCode == 200) {
        GitHubProfile gitHubProfile = GitHubProfile.fromJson(
          response.data,
        );

        return gitHubProfile;
      }
    } on DioException catch (e) {
      log(e.message ?? '');
      log(e.response.toString());
    }

    return null;
  }
}
