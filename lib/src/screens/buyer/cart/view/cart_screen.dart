import 'package:cards_app/src/core/consts/app_constants.dart';
import 'package:cards_app/src/core/extensions/extensions.dart';
import 'package:cards_app/src/core/resources/app_radius.dart';
import 'package:cards_app/src/core/resources/app_spaces.dart';
import 'package:cards_app/src/core/resources/theme/theme.dart';
import 'package:cards_app/src/core/shared_widgets/box_shadow.dart';
import 'package:cards_app/src/core/shared_widgets/shared_widgets.dart';
import 'package:cards_app/src/screens/buyer/cart/view/widgets/cart_widget.dart';
import 'package:cards_app/src/screens/buyer/payment/view/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

import '../view_model/cart_view_model.dart';

class CartScreen extends HookWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartViewModel = context.read<CartVM>();

    useEffect(() {
      cartViewModel.getCart();

      return () {};
    }, []);

    return Consumer<CartVM>(
      builder: (context, cartVM, child) {
        final cartData = cartVM.cartList;

        //! TODO-Check Move to widgets folder
        if (cartData.isEmpty) {
          return const EmptyCartWidget();
        }

        return Column(
          children: [
            ListView.separated(
                padding: const EdgeInsets.symmetric(
                    vertical: AppSpaces.defaultPadding),
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    BuildCartWidget(cart: cartData[index], index: index),
                separatorBuilder: (context, index) => context.mediumGap,
                itemCount: cartData.length),
            const Spacer(),
            if (cartData.isNotEmpty)
              InkWell(
                onTap: () => context.to(const PaymentScreen()),
                child: Container(
                  padding: const EdgeInsets.all(AppSpaces.defaultPadding),
                  margin: const EdgeInsets.all(AppSpaces.defaultPadding),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          colors: ColorManager.gradientBackground),
                      boxShadow: ConstantsWidgets.boxShadow,
                      borderRadius:
                          BorderRadius.circular(AppRadius.productRadius)),
                  child: Row(
                    children: [
                      Text(
                        context.tr.total,
                        style: context.whiteSubTitle,
                      ),
                      Text(
                        '${cartVM.total.toString()} ${AppConsts.currency}',
                        style: context.whiteTitle,
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Text(
                            context.tr.payment,
                            style: context.whiteTitle,
                          ),
                          context.xSmallGap,
                          const Icon(Icons.arrow_forward_ios_rounded,
                              color: ColorManager.white),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
