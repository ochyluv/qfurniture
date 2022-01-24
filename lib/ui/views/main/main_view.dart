import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qfurniture/ui/views/cart/cart_view.dart';
import 'package:qfurniture/ui/views/chat/chat_view.dart';
import 'package:qfurniture/ui/views/home/home_view.dart';
import 'package:qfurniture/ui/views/main/main_viewmodel.dart';
import 'package:qfurniture/ui/views/profile/profile_view.dart';
import 'package:qfurniture/ui/views/shared/colors.dart';
import 'package:qfurniture/ui/views/wish_list/wish_list_viw.dart';
import 'package:stacked/stacked.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: PageTransitionSwitcher(
          duration: const Duration(milliseconds: 300),
          reverse: model.reverse,
          transitionBuilder: (
            Widget child,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return SharedAxisTransition(
              child: child,
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.horizontal,
            );
          },
          child: getViewForIndex(model.currentIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: model.currentIndex,
          onTap: model.setIndex,
          items: [
            BottomNavigationBarItem(
              label: '',
              icon: SvgPicture.asset(
                'assets/icons/home.svg',
                color: model.isIndexSelected(0) ? kPrimaryColor : Colors.grey,
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: SvgPicture.asset(
                'assets/icons/Chat.svg',
                color: model.isIndexSelected(1) ? kPrimaryColor : null,
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: SvgPicture.asset(
                'assets/icons/Cart.svg',
                color: model.isIndexSelected(2) ? kPrimaryColor : null,
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: SvgPicture.asset(
                'assets/icons/Wishlist.svg',
                color: model.isIndexSelected(3) ? kPrimaryColor : null,
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: SvgPicture.asset(
                'assets/icons/profile.svg',
                color: model.isIndexSelected(4) ? kPrimaryColor : null,
              ),
            ),
          ],
        ),
      ),
      viewModelBuilder: () => MainViewModel(),
    );
  }
}

Widget getViewForIndex(int index) {
  switch (index) {
    case 0:
      return HomeView();
    case 1:
      return ChatView();
    case 2:
      return CartView();
    case 3:
      return WishListView();
    case 3:
      return ProfileView();
    default:
      return HomeView();
  }
}
