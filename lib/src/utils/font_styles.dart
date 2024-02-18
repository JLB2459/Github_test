import 'package:flutter/material.dart';
import 'package:github_test/src/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class FontStyles {
  static final TextTheme textTheme = GoogleFonts.jostTextTheme();

  static final title = GoogleFonts.jost(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Colors.black,
    fontStyle: FontStyle.normal,
  );

  static final title2 = GoogleFonts.jost(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontStyle: FontStyle.normal,
  );

  static final subtitle = GoogleFonts.jost(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.black,
    fontStyle: FontStyle.normal,
  );

  static final subtitle2 = GoogleFonts.jost(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Colors.black,
    fontStyle: FontStyle.normal,
  );

  static final normal = GoogleFonts.jost(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.grey,
  );
}
