import 'package:flutter/material.dart';
import '../tokens/app_colors.dart';
import '../tokens/app_fonts.dart';

class DrawerTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final String? info;
  const DrawerTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.info,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        color: AppColors.primary,
      ),
      title: Text(
        title,
        style: AppFonts.subtitle,
      ),
      trailing: info != null
          ? Text(
              info!,
              style: AppFonts.body,
            )
          : const SizedBox(),
    );
  }
}
