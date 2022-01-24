import 'package:flutter/material.dart';
import 'package:qfurniture/ui/views/product_details/product_details_viewmodel.dart';
import 'package:stacked/stacked.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProductDetailsViewModel>.reactive(
      builder: (context, model, child) => Scaffold(),
      viewModelBuilder: () => ProductDetailsViewModel(),
    );
  }
}
