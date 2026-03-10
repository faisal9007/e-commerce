import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/assets_path.dart';
import '../../../../app/constant.dart';

class ProductsCard extends StatelessWidget {
  const ProductsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      child: Card(
        elevation: 2,
        shadowColor: AppColors.themeColor.withAlpha(30),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        color: Colors.white,
        child: Column(
          children: [
            Container(
              width: 180,
              height: 140,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.themeColor.withAlpha(20),
                borderRadius: .only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
              ),
              child: Image.asset(AssetsPath.dummyShoePng),
            ),
            Padding(
              padding: .all(8.0),
              child: Column(
                spacing: 4,
                children: [
                  Text(
                    'New Year Special Shoe 30 ',
                    maxLines: 1,
                    style: TextStyle(
                      fontWeight: .w500,
                      color: Colors.black54,
                      overflow: .ellipsis,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text(
                        '${Constant.takaSign}120',
                        style: TextStyle(
                          color: AppColors.themeColor,
                          fontWeight: .w500,
                        ),

                      ),
                      Wrap(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 16),
                          Text('4.8')
                        ],
                      ),

                      Container(
                        padding: .all(4),
                        decoration: BoxDecoration(
                          color: AppColors.themeColor,
                          borderRadius: BorderRadius.circular(8),),
                        child: Icon(Icons.favorite_outline, color: Colors.white,size: 18,),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 4),
          ],
        ),
      ),
    );
  }
}