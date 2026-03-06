import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/app/app_colors.dart';
import 'package:flutter/material.dart';

class HomeCarousel extends StatefulWidget {
  const HomeCarousel({super.key});

  @override
  State<HomeCarousel> createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> {
  final ValueNotifier<int> _selectedPage = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 200.0,
            viewportFraction: 1.0,
            onPageChanged: (index, reason) => _selectedPage.value = index,
          ),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 2.0),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  alignment: .center,
                  child: Text(
                    'text $i',
                    style: TextStyle(fontSize: 16.0, color: Colors.black),
                  ),
                );
              },
            );
          }).toList(),
        ),
        SizedBox(height: 16),
        ValueListenableBuilder(
          valueListenable: _selectedPage,
          builder: (context, value, _) {
            return Row(
              mainAxisAlignment: .center,
              spacing: 4,
              children: [
                for (int i = 0; i < 5; i++)
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: value == i
                          ? AppColors.themeColor
                          : Colors.transparent,
                      border: Border.all(
                        color: value == i ? AppColors.themeColor : Colors.grey,
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}
