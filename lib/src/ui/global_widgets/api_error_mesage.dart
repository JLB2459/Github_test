import 'package:flutter/material.dart';
import 'package:github_test/src/utils/font_styles.dart';

class ApiErrorMessage extends StatelessWidget {
  const ApiErrorMessage({
    super.key,
    required this.message,
  });
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: FontStyles.normal,
        textAlign: TextAlign.center,
      ),
    );
  }
}
