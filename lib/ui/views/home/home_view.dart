import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:qfurniture/ui/views/home/home_viewmodel.dart';
import 'package:qfurniture/ui/views/shared/colors.dart';
import 'package:qfurniture/ui/views/shared/dumb_widgets/furniture_list_card.dart';
import 'package:qfurniture/ui/views/shared/dumb_widgets/furniture_textfield.dart';
import 'package:qfurniture/ui/views/shared/spacing.dart';
import 'package:qfurniture/ui/views/shared/text_styles.dart';
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
                        ),
                        verticalSpaceMedium,
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              FurnitureListCard(
                                image: 'assets/images/chair.png',
                                category: 'Chair',
                              ),
                              horizontalSpaceMedium,
                              FurnitureListCard(
                                image: 'assets/images/sofa.png',
                                category: 'Sofa',
                              ),
                              horizontalSpaceMedium,
                              FurnitureListCard(
                                image: 'assets/images/desk.png',
                                category: 'Desk',
                              ),
                            ],
                          ),
                        ),
                        verticalSpaceMedium,
                        PercentageCard(
                          image: AssetImage(
                            'assets/images/group_couch.png',
                          ),
                        ),
                        verticalSpaceMedium,
                        FurnitureListTile(
                          title: 'Popular',
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              PopularCard(
                                image: 'assets/images/sverom_chair.png',
                                title: 'Sverom Chair',
                                amount: '400',
                              ),
                              horizontalSpaceMedium,
                              PopularCard(
                                image: 'assets/images/norrviken_chair_and_table.png',
                                title: 'Norrviken Chair and Table',
                                amount: '999',
                              ),
                            ],
                          ),
                        ),
                        verticalSpaceSmall,
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              PopularCard(
                                image: 'assets/images/ektorp_sofa.png',
                                title: 'Ektorp Sofa',
                                amount: '599',
                              ),
                              horizontalSpaceMedium,
                              PopularCard(
                                image: 'assets/images/Jan_Sflanaganvik_sofa.png',
                                title: 'Jan Sflanaganvik Sofa',
                                amount: '599',
                              ),
                            ],
                          ),
                        ),
                        verticalSpaceMedium,
                        PercentageCard(
                          image: AssetImage(
                            'assets/images/confi_chair.png',
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
                                image: 'assets/images/dinning_room.png',
                              ),
                              RoomsFurnitures(
                                room: 'Bed\n' 'Room',
                                image: 'assets/images/bed_room.png',
                              ),
                              RoomsFurnitures(
                                room: 'Office\n' 'Room',
                                image: 'assets/images/office_space.png',
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

  // Child(CarouselController carouselController) {}
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
                  // decoration: BoxDecoration(
                  //   image: DecorationImage(
                  //     image: AssetImage(
                  //       'assets/images/Indicator.png',
                  //     ),
                  //   ),
                  // ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PopularCard extends StatelessWidget {
  const PopularCard({
    Key? key,
    this.title = '',
    required this.image,
    required this.amount,
    this.onFavoriteTap,
    this.isFavoriteTap = false,
  }) : super(key: key);

  final void Function()? onFavoriteTap;
  final String title;
  final String image;
  final String amount;
  final bool isFavoriteTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      // elevation: 2,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: 150,
                  height: 150,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                      image: DecorationImage(
                        image: AssetImage(
                          image,
                        ),

                        // fit: BoxFit.fill
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 2,
                  child: IconButton(
                    icon: Icon(
                      isFavoriteTap ? Icons.favorite : Icons.favorite_border,
                      color: isFavoriteTap ? Colors.red : null,
                    ),
                    iconSize: 25,
                    onPressed: onFavoriteTap,
                  ),
                ),
              ],
            ),
            verticalSpaceSmall,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppStyle.kHeading5.copyWith(
                      color: kTertiaryColor,
                    ),
                  ),
                  Text(
                    amount,
                    style: AppStyle.kHeading2.copyWith(
                      color: kTertiaryColor,
                    ),
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
        GestureDetector(
          onTap: onTap,
          child: Text(
            'See all',
            style: AppStyle.kHeading4.copyWith(
              color: kPrimaryColor,
            ),
          ),
        ),
        horizontalSpaceSmall,
        Icon(
          Icons.arrow_forward,
          color: kPrimaryColor,
        ),
      ],
    );
  }
}
