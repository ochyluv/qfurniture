import 'package:qfurniture/app/app.locator.dart';
import 'package:qfurniture/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class Category {
  final String category;
  final String image;

  Category(this.category, this.image);
}

class HomeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void goToProductDetailsView() {
    _navigationService.navigateTo(Routes.productDetailsView);
  }

  List<Category> categories = [
    Category('Chair', 'assets/images/chair.png'),
    Category('Sofa', 'assets/images/sofa.png'),
    Category('Desk', 'assets/images/desk.png'),
  ];
}
