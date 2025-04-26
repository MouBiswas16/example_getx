import 'package:get/get.dart';

class FavoriteController extends GetxController {
  RxList<String> fruitList = ["Apple", "Oranges", "Jackfruits", "Banana"].obs;
  RxList favoriteFruitArray = [].obs;

  addToFavorite(String value) {
    favoriteFruitArray.add(value);
  }

  removeFromFavorite(String value) {
    favoriteFruitArray.remove(value);
  }
}
