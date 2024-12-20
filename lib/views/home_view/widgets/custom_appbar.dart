import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nots_app/generated/l10n.dart';
import 'package:nots_app/views/home_view/view/search_view.dart';
import 'package:nots_app/views/home_view/widgets/menu_button.dart';
import 'package:nots_app/views/home_view/widgets/setting_dialog.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      leading: MenuButton(),
      title: Text(
        S.of(context).title,
        style: TextStyle(
          fontSize: 43.sp,
          fontWeight: FontWeight.w300,
          color: Theme.of(context).textTheme.bodyLarge?.color,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, SearchView.id);
          },
          icon: Icon(
            Icons.search,
            color: Theme.of(context).iconTheme.color,
            size: 28.h,
          ),
        ),
        IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => const SettingDialog(),
            );
          },
          icon: Icon(
            Icons.settings,
            color: Theme.of(context).iconTheme.color,
            size: 28.h,
          ),
        ),
        SizedBox(width: 10.w),
      ],
    );
  }
}
