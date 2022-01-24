import 'package:qfurniture/app/app.locator.dart';
import 'package:qfurniture/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartUpViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  Future<void> goToMainView() async {
    await Future.delayed(Duration(seconds: 3));
    await _navigationService.replaceWith(Routes.mainView);
  }
}
