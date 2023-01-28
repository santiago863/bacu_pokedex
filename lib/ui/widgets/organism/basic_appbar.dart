import 'package:flutter/material.dart';
import '../tokens/app_colors.dart';
import '../tokens/app_fonts.dart';

class BasicAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const BasicAppbar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      iconTheme: const IconThemeData(
        color: AppColors.black,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      centerTitle: true,
      title: Text(
        title,
        style: AppFonts.title.copyWith(
          color: AppColors.black,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(65);
}
