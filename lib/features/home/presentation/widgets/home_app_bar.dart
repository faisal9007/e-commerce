import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../app/assets_path.dart';
import 'app_bar_icon_button.dart';
class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: SvgPicture.asset(AssetsPath.navLogoSvg),
        actions: [
          AppBarIconButton(icon: Icons.person, onTap: () {}),
          SizedBox(width: 6),
          AppBarIconButton(icon: Icons.phone, onTap: () {}),
          SizedBox(width: 6),
          AppBarIconButton(
            icon: Icons.notifications_active_outlined,
            onTap: () {},
          ),
        ],
      ),
    );;
  }

  @override

  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

