import 'package:flutter/material.dart';
import 'package:qfurniture/ui/views/profile/profile_viewmodel.dart';
import 'package:qfurniture/ui/views/shared/text_styles.dart';
import 'package:stacked/stacked.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Text(
            'Profile View',
            style: AppStyle.kHeading1,
          ),
        ),
      ),
      viewModelBuilder: () => ProfileViewModel(),
    );
  }
}
