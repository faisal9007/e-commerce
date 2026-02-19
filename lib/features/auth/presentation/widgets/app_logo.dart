import 'package:flutter_svg/svg.dart';
import '../../../../app/assets_path.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,  this.height = 120,  this.width = 120,
  });

  final double height;
  final double width;


  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(AssetsPath.logoSvg, width: width, height: height,);
  }
}
