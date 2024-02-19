import 'package:flutter/material.dart';
import 'package:github_test/src/utils/font_styles.dart';

abstract class Dialogs {
  static Future<void>? alert(
    BuildContext context, {
    String? title,
    String? description,
    String okText = 'OK',
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: title != null
              ? Text(
                  title,
                  style: FontStyles.subtitle,
                  textAlign: TextAlign.center,
                )
              : null,
          content: description != null
              ? Text(
                  description,
                  style: FontStyles.normal,
                )
              : null,
          actions: [
            TextButton(
              onPressed: () => Navigator.maybePop(context),
              child: Text(
                okText,
              ),
            )
          ],
        );
      },
    );
    return null;
  }
}
