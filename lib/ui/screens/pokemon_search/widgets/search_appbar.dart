import 'package:flutter/material.dart';
import '../../../widgets/tokens/app_colors.dart';
import '../../../widgets/tokens/app_fonts.dart';

class SearchAppbar extends StatelessWidget implements PreferredSizeWidget {
  static const double _height = 130;
  final Function(String) onTap;
  final _searchController = TextEditingController();
  SearchAppbar({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      toolbarHeight: _height,
      backgroundColor: AppColors.primary,
      iconTheme: const IconThemeData(
        color: AppColors.black,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () => onTap(_searchController.text),
          icon: const Icon(
            Icons.search,
          ),
        ),
      ],
      title: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Search Pokemon',
            style: AppFonts.title.copyWith(
              color: AppColors.black,
            ),
          ),
          TextFormField(
            controller: _searchController,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(_height);
}
