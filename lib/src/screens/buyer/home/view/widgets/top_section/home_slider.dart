import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/core/resources/theme/theme.dart';
import 'package:cards_app/src/core/shared_widgets/shared_widgets.dart';
import 'package:cards_app/src/screens/buyer/home/view_model/slider_view_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeSlider extends StatelessWidget {
  const HomeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SliderVM>(
      builder: (context, sliderVM, child) {
        if (sliderVM.isLoading) {
          return const SliderLoading();
        }
        return Column(
          children: [
            CarouselSlider(
              items: sliderVM.sliders
                  .map(
                    (slider) => GestureDetector(
                      onTap: () {
                        sliderVM.openSliderUrl('https://www.google.com');
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          height: context.height * .20,
                          slider.image?.url ?? '',
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
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
              children: sliderVM.sliders.asMap().entries.map((entry) {
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
