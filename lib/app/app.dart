import 'package:qfurniture/ui/views/home/home_view.dart';
import 'package:qfurniture/ui/views/main/main_view.dart';
import 'package:qfurniture/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    AdaptiveRoute(page: StartUpView, initial: true),
    AdaptiveRoute(page: MainView),
    // AdaptiveRoute(page: HomeView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
  ],
)
class AppSetup {}
