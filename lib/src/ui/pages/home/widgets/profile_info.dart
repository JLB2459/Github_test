import 'package:flutter/material.dart';
import 'package:github_test/src/utils/font_styles.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({
    super.key,
    required this.title,
    required this.info,
  });
  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          // '10',
          info,
          style: FontStyles.title2.copyWith(
            fontSize: 16,
          ),
        ),
        Text(
          // 'Repos',
          title,
          style: FontStyles.normal,
        ),
      ],
    );
  }
}
