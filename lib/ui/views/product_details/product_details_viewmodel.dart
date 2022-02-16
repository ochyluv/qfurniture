import 'package:qfurniture/app/app.locator.dart';
import 'package:qfurniture/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProductDetailsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void navigateBack() {
    _navigationService.back();
  }

  void goToMyShoppingBagView() {
    _navigationService.navigateTo(Routes.myShoppingBagView);
  }
}
