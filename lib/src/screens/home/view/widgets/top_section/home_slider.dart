import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/screens/home/view_model/slider_view_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/resources/app_radius.dart';
import '../../../../../core/resources/theme/theme.dart';
import '../../../models/slider_model.dart';

class HomeSlider extends StatelessWidget {
  const HomeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SliderVM>(
      builder: (context, sliderVM, child) {
        return Column(
          children: [
            CarouselSlider(
              items: SliderModel.slider
                  .map(
                    (slider) => GestureDetector(
                      onTap: () {},
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              height: context.height * .20,
                              slider.image!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          Positioned.fill(
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(.5),
                                borderRadius:
                                    BorderRadius.circular(AppRadius.baseRadius),
                              ),
                              child: Center(
                                child: Text(
                                  slider.title!,
                                  style: context.headLine.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ).paddingSymmetric(horizontal: 5),
                  )
                  .toList(),
              options: CarouselOptions(
                  viewportFraction: 0.9,
                  height: context.height * .20,
                  aspectRatio: 2.5,
                  enlargeFactor: .3,
                  onPageChanged: (index, d) => sliderVM.setCurrentIndex(index)),
            ),

            context.mediumGap,

            // ! indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: SliderModel.slider.asMap().entries.map((entry) {
                return GestureDetector(
                    child: Container(
                  width: 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: sliderVM.currentIndex == entry.key
                        ? ColorManager.secondaryColor
                        : Colors.grey.withOpacity(0.5),
                  ),
                ));
              }).toList(),
            ),
          ],
        );
      },
    );
  }
}
