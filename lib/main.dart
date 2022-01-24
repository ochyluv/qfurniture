import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qfurniture/app/app.locator.dart';
import 'package:qfurniture/app/app.router.dart';
import 'package:qfurniture/ui/views/home/home_view.dart';
import 'package:stacked_services/stacked_services.dart';

Future main() async {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QFurniture',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}
