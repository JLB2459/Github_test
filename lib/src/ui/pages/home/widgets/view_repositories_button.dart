import 'package:flutter/material.dart';
import 'package:github_test/src/routes/routes/routes.dart';
import 'package:github_test/src/ui/global_widgets/rounded_button.dart';

class ViewRepositoriesButton extends StatelessWidget {
  const ViewRepositoriesButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: RoundedButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.myRepositories);
        },
      ),
    );
  }
}
