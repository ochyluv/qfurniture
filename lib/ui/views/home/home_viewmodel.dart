import 'package:stacked/stacked.dart';

class Category {
  final String category;
  final String image;

  Category(this.category, this.image);
}

class HomeViewModel extends BaseViewModel {
  List<Category> categories = [
    Category('Chair', 'assets/images/chair.png'),
    Category('Sofa', 'assets/images/sofa.png'),
    Category('Desk', 'assets/images/desk.png'),
  ];
}
