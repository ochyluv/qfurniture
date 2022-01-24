import 'package:flutter/material.dart';
import 'package:qfurniture/ui/views/home/home_viewmodel.dart';
import 'package:qfurniture/ui/views/shared/colors.dart';
import 'package:qfurniture/ui/views/shared/spacing.dart';
import 'package:qfurniture/ui/views/shared/text_styles.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

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
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
