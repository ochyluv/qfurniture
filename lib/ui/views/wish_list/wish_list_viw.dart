import 'package:flutter/material.dart';

import 'package:qfurniture/ui/views/shared/text_styles.dart';
import 'package:qfurniture/ui/views/wish_list/wish_list_viewmodel.dart';
import 'package:stacked/stacked.dart';

class WishListView extends StatelessWidget {
  const WishListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WishListViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Text(
            'Wish List',
            style: AppStyle.kHeading1,
          ),
        ),
      ),
      viewModelBuilder: () => WishListViewModel(),
    );
  }
}
