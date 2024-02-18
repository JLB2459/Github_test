import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_test/src/utils/app_colors.dart';
import 'package:github_test/src/utils/font_styles.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    super.key,
    this.label = 'Ver Repositorios',
    this.onPressed,
    this.labelStyle,
  });
  final String label;
  final VoidCallback? onPressed;
  final TextStyle? labelStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CupertinoButton(
        borderRadius: BorderRadius.circular(
          50,
        ),
        color: AppColors.primaryColor,
        disabledColor: Colors.grey.shade400,
        onPressed: onPressed,
        child: Text(
          // text the label
          label,
          style: labelStyle ??
              FontStyles.subtitle.copyWith(
                fontSize: 14,
                color: Colors.white,
              ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
