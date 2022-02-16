import 'package:flutter/material.dart';
import 'package:qfurniture/ui/shared/colors.dart';
import 'package:qfurniture/ui/shared/dumb_widgets/furniture_textfield.dart';
import 'package:qfurniture/ui/shared/smart_widgets/product_card.dart';
import 'package:qfurniture/ui/shared/smart_widgets/product_counter.dart';
import 'package:qfurniture/ui/shared/spacing.dart';
import 'package:qfurniture/ui/shared/text_styles.dart';
import 'package:qfurniture/ui/views/my_shopping_bag/my_shopping_bag_viewmodel.dart';
import 'package:qfurniture/utiliy/assets.dart';
import 'package:stacked/stacked.dart';

class MyShoppingBagView extends StatelessWidget {
  const MyShoppingBagView({Key? key, this.onBackTap}) : super(key: key);

  final void Function()? onBackTap;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MyShoppingBagViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: kWhiteColor,
            leading: GestureDetector(
              child: Icon(Icons.arrow_back_rounded, color: Colors.black),
              onTap: model.navigateBack,
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'My Shopping Bag',
                        style: AppStyle.kHeading1,
                      ),
                      verticalSpaceRegular,
                      MyShoppingBagProperties(
                        image: Assets.JanSofa,
                        title: 'Jan Sflanaganvik sofa',
                        amount: '\$599',
                      ),
                      verticalSpaceSmall,
                      Divider(),
                      verticalSpaceSmall,
                      MyShoppingBagProperties(
                        image: Assets.sveromChair,
                        title: 'Sverom Chair',
                        amount: '\$400',
                      ),
                      verticalSpaceSmall,
                      Divider(),
                      verticalSpaceSmall,
                      MyShoppingBagProperties(
                        image: Assets.kallaxChair,
                        title: 'Kallax Chair',
                        amount: '\$199',
                      ),
                    ],
                  ),
                ),
                verticalSpaceSmall,
                Divider(
                  thickness: 5,
                ),
                verticalSpaceRegular,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: SizedBox(
                          height: 50,
                          child: FurnitureTextField(
                            hintText: 'Insert your coupon code',
                          ),
                        ),
                      ),
                      horizontalSpaceRegular,
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                            ),
                            onPressed: () {},
                            child: Text(
                              'Apply',
                              style: AppStyle.kHeading4,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                verticalSpaceRegular,
                Divider(
                  thickness: 5,
                ),
                verticalSpaceRegular,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sofa your might like',
                        style: AppStyle.kHeading2,
                      ),
                      verticalSpaceRegular,
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ProductCard(
                              image: Assets.ektorpSofa,
                              title: 'Ektorp Sofa',
                              amount: '\$599',
                            ),
                            horizontalSpaceMedium,
                            ProductCard(
                              image: Assets.grundtalSofa,
                              title: 'Grundtal Sofa',
                              amount: '\$599',
                            ),
                            horizontalSpaceMedium,
                            ProductCard(
                              image: Assets.JanSofa,
                              title: 'Jan Sflanaganvik Sofa',
                              amount: '\$599',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // verticalSpaceRegular,
              ],
            ),
          ),
          bottomNavigationBar: ProceedToCheckButton(
            onPressed: () {},
          )),
      viewModelBuilder: () => MyShoppingBagViewModel(),
    );
  }
}

class MyShoppingBagProperties extends StatelessWidget {
  const MyShoppingBagProperties({
    required this.image,
    required this.title,
    required this.amount,
    Key? key,
    this.onTap,
  }) : super(key: key);

  final String image;
  final String title;
  final String amount;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 100.0,
          width: 100.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
            ),
          ),
        ),
        horizontalSpaceSmall,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppStyle.kHeading4,
            ),
            verticalSpaceSmall,
            Text(
              'Qty: 1',
              style: AppStyle.kHeading5,
            ),
            verticalSpaceSmall,
            ProductCounter(),
          ],
        ),
        Spacer(),
        Column(
          children: [
            CounterButton(
              onTap: onTap,
              title: 'X',
            ),
            verticalSpaceMedium,
            Text(
              amount,
              style: AppStyle.kHeading3,
            )
          ],
        )
      ],
    );
  }
}

class ProceedToCheckButton extends StatelessWidget {
  const ProceedToCheckButton({Key? key, this.onPressed}) : super(key: key);

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total',
                  style: AppStyle.kHeading5,
                ),
                Text(
                  '\$1,198',
                  style: AppStyle.kHeading3.copyWith(color: kPrimaryColor),
                ),
              ],
            ),
            horizontalSpaceLarge,
            Expanded(
              flex: 4,
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                  ),
                  child: Text(
                    'Proceed to checkout',
                    style: AppStyle.kHeading4,
                  ),
                  onPressed: onPressed,
                ),
              ),
            )
          ],
        ));
  }
}
