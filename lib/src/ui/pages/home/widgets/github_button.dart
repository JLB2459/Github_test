import 'package:flutter/cupertino.dart' show CupertinoButton;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class GitHubButton extends StatelessWidget {
  const GitHubButton({
    super.key,
    required this.url,
  });
  final String url;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      borderRadius: BorderRadius.zero,
      padding: EdgeInsets.zero,
      pressedOpacity: 0.65,
      child: Row(
        children: [
          Image.network(
            'https://logos-world.net/wp-content/uploads/2020/11/GitHub-Logo.png',
            width: 32,
            errorBuilder: (context, error, stackTrace) => Icon(
              Icons.error_outline_rounded,
              color: Colors.grey.shade300,
            ),
          ),
        ],
      ),
      onPressed: () {
        _launchInBrowser(Uri.parse(url));
      },
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
