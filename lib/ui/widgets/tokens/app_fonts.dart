import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/ui/widgets/tokens/app_colors.dart';

abstract class AppFonts {
  static final TextStyle title = GoogleFonts.bebasNeue(
    color: AppColors.primary,
    fontSize: 30,
  );
  static final TextStyle subtitle = GoogleFonts.righteous(
    color: AppColors.black,
    fontSize: 13,
  );
  static final TextStyle body = GoogleFonts.comfortaa(
    color: AppColors.grey,
    fontWeight: FontWeight.bold,
    fontSize: 10,
  );
}
