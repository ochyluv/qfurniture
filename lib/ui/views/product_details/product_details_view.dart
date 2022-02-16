import 'package:flutter/material.dart';
import 'package:qfurniture/ui/shared/colors.dart';
import 'package:qfurniture/ui/shared/smart_widgets/product_card.dart';
import 'package:qfurniture/ui/shared/smart_widgets/product_counter.dart';
import 'package:qfurniture/ui/shared/spacing.dart';
import 'package:qfurniture/ui/shared/text_styles.dart';
import 'package:qfurniture/ui/views/product_details/product_details_viewmodel.dart';
import 'package:qfurniture/utiliy/assets.dart';
import 'package:stacked/stacked.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProductDetailsViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                stretch: true,
                pinned: true,
                backgroundColor: kWhiteColor,
                collapsedHeight: kToolbarHeight,
                expandedHeight: 300.0,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    Assets.JanSofa,
                    fit: BoxFit.fill,
                  ),
                ),
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: model.navigateBack,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(5),
                      ),
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(6),
                      child: Icon(
                        Icons.arrow_back_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(6),
                      child: Icon(
                        Icons.share_sharp,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ];
          },
          body: Container(
            decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Jan Sflanaganvik sofa',
                          style: AppStyle.kHeading2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$599',
                              style: AppStyle.kHeading1.copyWith(
                                color: kPrimaryColor,
                              ),
                            ),
                            ProductCounter(),
                          ],
                        ),
                        verticalSpaceSmall,
                        Container(
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[100],
                          ),
                          child: ListTile(
                            title: Row(
                              children: [
                                for (int i = 0; i < 4; i++)
                                  Icon(
                                    Icons.star,
                                    size: 20,
                                    color: kYellowColor,
                                  ),
                                Icon(
                                  Icons.star_sharp,
                                  size: 20,
                                  color: Color.fromARGB(255, 218, 211, 211),
                                ),
                                horizontalSpaceSmall,
                                Text(
                                  '4.6',
                                  style: AppStyle.kHeading5,
                                ),
                              ],
                            ),
                            subtitle: Text('98 Reviews  >'),
                            trailing: Container(
                              width: 110,
                              child: Stack(
                                children: [
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundImage: AssetImage(Assets.image1),
                                  ),
                                  Positioned(
                                    left: 25.0,
                                    child: CircleAvatar(
                                      radius: 20,
                                      backgroundImage: AssetImage(
                                        Assets.image2,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 50.0,
                                    child: CircleAvatar(
                                      radius: 20,
                                      backgroundImage: AssetImage(Assets.image3),
                                    ),
                                  ),
                                  Positioned(
                                    left: 73.0,
                                    child: CircleAvatar(
                                      radius: 20,
                                      backgroundImage: AssetImage(Assets.image4),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        verticalSpaceRegular,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: 140,
                              decoration: BoxDecoration(
                                color: Colors.orange[100],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                'Description',
                                style: AppStyle.kHeading3.copyWith(
                                  color: kPrimaryColor,
                                ),
                              ),
                            ),
                            Text(
                              'Materials',
                              style: AppStyle.kHeading3,
                            ),
                            Text(
                              'Reviews',
                              style: AppStyle.kHeading3,
                            ),
                          ],
                        ),
                        verticalSpaceRegular,
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc consectetur velit at massa vehicula, quis fringilla urna gravida.',
                          style: AppStyle.kHeading3,
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Similar Products',
                          style: AppStyle.kHeading2,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: SimilarProductsRow(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: _AddToBagButton(
          onPressed: model.goToMyShoppingBagView,
        ),
      ),
      viewModelBuilder: () => ProductDetailsViewModel(),
    );
  }
}

class SimilarProductsRow extends StatelessWidget {
  const SimilarProductsRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProductCard(
          image: Assets.sveromChair,
          title: 'Sverom Chair',
          amount: '\$400',
        ),
        horizontalSpaceMedium,
        ProductCard(
          image: Assets.grundtalSofa,
          title: 'Grundtal Sofa',
          amount: '\$499',
        ),
        horizontalSpaceMedium,
        ProductCard(
          image: Assets.norrvikenChair,
          title: 'Norrviken Chair and Table',
          amount: '\$499',
        ),
      ],
    );
  }
}

class _AddToBagButton extends StatelessWidget {
  const _AddToBagButton({
    this.onPressed,
    Key? key,
  }) : super(key: key);
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
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.favorite_border,
              color: Colors.grey,
            ),
          ),
          horizontalSpaceRegular,
          Expanded(
            flex: 4,
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                ),
                onPressed: onPressed,
                child: Text(
                  'Add to bag',
                  style: AppStyle.kHeading4,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class StackedImages extends StatelessWidget {
//   const StackedImages({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Widget(
//       buildStackedImages(){

//       }
//     );
//   }
// }
