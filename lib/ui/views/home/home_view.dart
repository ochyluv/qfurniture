import 'package:flutter/material.dart';
import 'package:qfurniture/ui/shared/colors.dart';
import 'package:qfurniture/ui/shared/dumb_widgets/furniture_list_card.dart';
import 'package:qfurniture/ui/shared/dumb_widgets/furniture_textfield.dart';
import 'package:qfurniture/ui/shared/smart_widgets/product_card.dart';
import 'package:qfurniture/ui/shared/spacing.dart';
import 'package:qfurniture/ui/shared/text_styles.dart';
import 'package:qfurniture/ui/views/home/home_viewmodel.dart';
import 'package:qfurniture/utiliy/assets.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  // CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpaceMedium,
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Explore What',
                          style: AppStyle.kHeading1,
                        ),
                        Text(
                          'Your Home Needs',
                          style: AppStyle.kHeading1,
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(
                      Icons.notification_important,
                      size: 40,
                      color: kPrimaryColor,
                    ),
                  ],
                ),
                verticalSpaceMedium,
                FurnitureTextField(
                  labelText: 'Chairs, desk, lamp, etc',
                  showPrefix: true,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        verticalSpaceMedium,
                        FurnitureListTile(
                          title: 'Categories',
                          onTap: model.goToProductDetailsView,
                        ),
                        verticalSpaceMedium,
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              FurnitureListCard(
                                image: Assets.chair,
                                category: 'Chair',
                              ),
                              horizontalSpaceMedium,
                              FurnitureListCard(
                                image: Assets.sofa,
                                category: 'Sofa',
                              ),
                              horizontalSpaceMedium,
                              FurnitureListCard(
                                image: Assets.desk,
                                category: 'Desk',
                              ),
                            ],
                          ),
                        ),
                        verticalSpaceMedium,
                        PercentageCard(
                          image: AssetImage(
                            Assets.groupCouch,
                          ),
                        ),
                        verticalSpaceMedium,
                        FurnitureListTile(
                          onTap: model.goToProductDetailsView,
                          title: 'Popular',
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              ProductCard(
                                image: Assets.sveromChair,
                                title: 'Sverom Chair',
                                amount: '\$400',
                              ),
                              horizontalSpaceMedium,
                              ProductCard(
                                image: Assets.norrvikenChair,
                                title: 'Norrviken Chair and Table',
                                amount: '\$999',
                              ),
                            ],
                          ),
                        ),
                        verticalSpaceSmall,
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
                                image: Assets.JanSofa,
                                title: 'Jan Sflanaganvik Sofa',
                                amount: '\$599',
                              ),
                            ],
                          ),
                        ),
                        verticalSpaceMedium,
                        PercentageCard(
                          image: AssetImage(
                            Assets.confiChair,
                          ),
                        ),
                        verticalSpaceSmall,
                        Text(
                          'Rooms',
                          style: AppStyle.kHeading1,
                        ),
                        Text(
                          'Furniture for every corners in your home',
                          style: AppStyle.kHeading5,
                        ),
                        verticalSpaceMedium,
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              RoomsFurnitures(
                                room: 'Dinning\n' 'Room',
                                image: Assets.dinningRoom,
                              ),
                              RoomsFurnitures(
                                room: 'Bed\n' 'Room',
                                image: Assets.bedRoom,
                              ),
                              RoomsFurnitures(
                                room: 'Office\n' 'Room',
                                image: Assets.officeSpace,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}

class RoomsFurnitures extends StatelessWidget {
  const RoomsFurnitures({
    Key? key,
    this.room = '',
    required this.image,
  }) : super(key: key);

  final String room;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        height: 250,
        width: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: Column(
                children: [
                  Text(
                    room,
                    style: AppStyle.kHeading3,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PercentageCard extends StatelessWidget {
  const PercentageCard({
    Key? key,
    required this.image,
  }) : super(key: key);
  final AssetImage image;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 400),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 150,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                      image: DecorationImage(image: image, fit: BoxFit.fill),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FurnitureListTile extends StatelessWidget {
  const FurnitureListTile({
    Key? key,
    this.title = '',
    this.onTap,
    this.icon,
  }) : super(key: key);

  final String title;
  final void Function()? onTap;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: AppStyle.kHeading1,
        ),
        Spacer(),
        TextButton(
          onPressed: onTap,
          child: Row(
            children: [
              Text(
                'See all',
                style: AppStyle.kHeading4.copyWith(
                  color: kPrimaryColor,
                ),
              ),
              horizontalSpaceSmall,
              Icon(
                Icons.arrow_forward,
                color: kPrimaryColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
