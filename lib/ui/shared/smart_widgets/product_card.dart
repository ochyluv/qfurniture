import 'package:flutter/material.dart';
import 'package:qfurniture/ui/shared/colors.dart';
import 'package:qfurniture/ui/shared/spacing.dart';
import 'package:qfurniture/ui/shared/text_styles.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    Key? key,
    this.title = '',
    required this.image,
    required this.amount,
  }) : super(key: key);
  final String title;
  final String image;
  final String amount;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool _isFavoriteTap = false;

  @override
  Widget build(BuildContext context) {
    return Card(
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
                          widget.image,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: kWhiteColor,
                      ),
                      child: IconButton(
                        icon: Icon(
                          _isFavoriteTap ? Icons.favorite : Icons.favorite_border,
                          color: _isFavoriteTap ? kRedColor : null,
                        ),
                        iconSize: 25,
                        onPressed: () {
                          setState(() {
                            _isFavoriteTap = !_isFavoriteTap;
                          });
                        },
                      ),
                    ),
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
                    widget.title,
                    style: AppStyle.kHeading5.copyWith(
                      color: kTertiaryColor,
                    ),
                  ),
                  Text(
                    widget.amount,
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
