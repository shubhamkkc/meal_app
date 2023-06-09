import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screen/categories_screen.dart';
import 'package:meal_app/screen/meal_screen.dart';
import 'package:meal_app/widget/meal_item.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int selectIndex = 0;
  final List<Meal> favoritesMeal = [];

  void onSelectFavorite(meal) {
    print(meal);
    if (favoritesMeal.contains(meal)) {
      setState(() {
        favoritesMeal.remove(meal);
      });
    } else {
      setState(() {
        favoritesMeal.add(meal);
      });
    }
  }

  void onItemTap(int index) {
    setState(() {
      selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget ActivePage = Categories();
    String title = "Categories";
    if (selectIndex == 1) {
      ActivePage = MealScreen(
        meals: favoritesMeal,
      );
      title = "Favorites";
    }
    return Scaffold(
      appBar: AppBar(title: Text(title)),
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
