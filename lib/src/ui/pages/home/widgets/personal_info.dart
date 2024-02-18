import 'package:flutter/material.dart';
import 'package:github_test/src/utils/font_styles.dart';

final _style = FontStyles.normal;

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({
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
        text: //'Correo',
            title,
        style: _style.copyWith(
          color: Colors.black,
        ),
        children: [
          const WidgetSpan(
            child: SizedBox(
              width: 6,
            ),
          ),
          TextSpan(
            text: info,
            style: _style,
          ),
        ],
      ),
    );
  }
}
