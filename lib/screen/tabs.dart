import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screen/categories_screen.dart';
import 'package:meal_app/screen/main_drawer.dart';
import 'package:meal_app/screen/meal_screen.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int selectIndex = 0;
  final List<Meal> favoritesMeal = [];

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    var snackdemo = SnackBar(
      content: Text(message),
      elevation: 10,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(5),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackdemo);
  }

  void onSelectFavorite(meal) {
    print(meal);
    if (favoritesMeal.contains(meal)) {
      setState(() {
        favoritesMeal.remove(meal);
      });
      showSnackBar("your favourite meal is removed");
    } else {
      setState(() {
        favoritesMeal.add(meal);
      });
      showSnackBar("marked as favourite");
    }
  }

  void onItemTap(int index) {
    setState(() {
      selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    Widget ActivePage = Categories(onSelectFavorite: onSelectFavorite);
    String title = "Categories";
    if (selectIndex == 1) {
      ActivePage =
          MealScreen(meals: favoritesMeal, onSelectFavorite: onSelectFavorite);
      title = "Favorites";
    }
    void onSelectScreen(String identifer) {
      if (identifer == 'meal') {
        Navigator.of(context).pop();
      } else {}
    }

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      drawer: MainDrawer(onSelectScreen: onSelectScreen),
      body: ActivePage,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.no_meals), label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite'),
        ],
        currentIndex: selectIndex,
        onTap: onItemTap,
      ),
    );
  }
}
