import 'package:flutter/material.dart';
import 'package:github_test/src/utils/font_styles.dart';

class CommitInfo extends StatelessWidget {
  const CommitInfo({
    super.key,
    required this.title,
    required this.info,
  });

  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '$title:',
        style: FontStyles.subtitle.copyWith(
          fontSize: 13.5,
        ),
        children: [
          const WidgetSpan(
            child: SizedBox(
              width: 6,
            ),
          ),
          TextSpan(
            text: info,
            style: FontStyles.normal.copyWith(
              fontSize: 13.5,
            ),
          )
        ],
      ),
    );
  }
}
