import 'package:flutter/material.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({
    super.key,
    this.isGreen = false,
  });
  final bool isGreen;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6,
      width: 6,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isGreen ? Colors.green.shade300 : Colors.red.shade500,
      ),
    );
  }
}
