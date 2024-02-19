import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_test/src/utils/app_colors.dart';
import 'package:github_test/src/utils/font_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewProjectButton extends StatelessWidget {
  const ViewProjectButton({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: SizedBox(
        width: double.infinity,
        child: CupertinoButton(
          borderRadius: BorderRadius.circular(
            50,
          ),
          color: AppColors.primaryColor,
          disabledColor: Colors.grey.shade400,
          onPressed: () => _launchInBrowser(
            Uri.parse(url),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.language_rounded),
              const SizedBox(
                width: 6,
              ),
              Flexible(
                child: Text(
                  'Ver Proyecto en GitHub',
                  style: FontStyles.subtitle.copyWith(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> _launchInBrowser(Uri url) async {
  if (!await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  )) {
    throw Exception('Could not launch $url');
  }
}
