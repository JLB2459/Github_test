import 'package:flutter/material.dart';
import 'package:github_test/src/utils/app_colors.dart';
import 'package:github_test/src/utils/dialogs.dart';

class InfoButton extends StatelessWidget {
  const InfoButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => showInfoDialog(context),
      icon: const Icon(Icons.info_outline_rounded),
      color: AppColors.secondaryBlueColor,
    );
  }

  void showInfoDialog(BuildContext context) {
    Dialogs.alert(
      context,
      title: 'NOTA:',
      description:
          'Para poder actualizar los commits de este proyecto presiona y deslice hacia abajo en el contenido.',
    );
  }
}
