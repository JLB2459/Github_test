import 'package:flutter/material.dart';
import 'package:github_test/src/ui/pages/my_repositories/widgets/my_custom_indicator.dart';
import 'package:github_test/src/utils/font_styles.dart';

class RepositoryInfo extends StatelessWidget {
  const RepositoryInfo({
    super.key,
    required this.title,
    required this.info,
    this.isGreen = false,
  });
  final String title;
  final String info;
  final bool isGreen;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomIndicator(
          isGreen: isGreen,
        ),
        const SizedBox(
          width: 4,
        ),
        Flexible(
          child: RichText(
            text: TextSpan(
              text: // 'Lenguaje:',
                  '$title:',
              style: FontStyles.subtitle.copyWith(
                fontSize: 14,
              ),
              children: [
                const WidgetSpan(
                  child: SizedBox(
                    width: 6,
                  ),
                ),
                TextSpan(
                  text: // 'Dart',
                      info,
                  style: FontStyles.normal,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
