import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:provider/provider.dart';

class FavrouiteMealProvider with ChangeNotifier {
  final List<Meal> _favoritesMeal = [];
  List<Meal> get favoritesMeal => _favoritesMeal;

  // void showSnackBar(String message) {
  //   ScaffoldMessenger.of(context).clearSnackBars();
  //   var snackdemo = SnackBar(
  //     content: Text(message),
  //     elevation: 10,
  //     behavior: SnackBarBehavior.floating,
  //     margin: const EdgeInsets.all(5),
  //   );

  //   ScaffoldMessenger.of(context).showSnackBar(snackdemo);
  // }

  bool addToFavoritesMeal(Meal favorite) {
    _favoritesMeal.add(favorite);
    notifyListeners();
    return true;
  }

  bool removeFromFavoritesMeal(Meal favorite) {
    _favoritesMeal.remove(favorite);
    notifyListeners();
    return false;
  }

  // void onSelectFavorite(meal) {
  //   if (_favoritesMeal.contains(meal)) {

  //       _favoritesMeal.remove(meal);
  //       notifyListeners();

  //     // showSnackBar("your favourite meal is removed");
  //   } else {

  //       _favoritesMeal.add(meal);
  //       notifyListeners();

  //     // showSnackBar("marked as favourite");
  //   }
  // }
}
