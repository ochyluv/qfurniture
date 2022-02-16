import 'package:flutter/material.dart';
import 'package:qfurniture/ui/shared/text_styles.dart';

class FurnitureListCard extends StatelessWidget {
  const FurnitureListCard({
    Key? key,
    this.category = '',
    required this.image,
  }) : super(key: key);
  final String category;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              category,
              style: AppStyle.kHeading3,
            ),
          )
        ],
      ),
    );
  }
}
