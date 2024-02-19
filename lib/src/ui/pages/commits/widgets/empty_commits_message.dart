import 'package:flutter/material.dart';
import 'package:github_test/src/utils/font_styles.dart';

class EmptyCommitsMessage extends StatelessWidget {
  const EmptyCommitsMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'No se ha realizado ningún commiten este proeycto.',
        style: FontStyles.normal,
        textAlign: TextAlign.center,
      ),
    );
  }
}
