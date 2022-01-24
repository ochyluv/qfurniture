import 'package:flutter/material.dart';
import 'package:qfurniture/ui/views/cart/cart_viewmodel.dart';
import 'package:qfurniture/ui/views/shared/text_styles.dart';
import 'package:stacked/stacked.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CartViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Text(
            'Cart View',
            style: AppStyle.kHeading1,
          ),
        ),
      ),
      viewModelBuilder: () => CartViewModel(),
    );
  }
}
