import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/provider/favrouite_meal_provider.dart';
import 'package:meal_app/provider/filter_provider.dart';
import 'package:meal_app/screen/categories_screen.dart';
import 'package:meal_app/screen/filter.dart';
import 'package:meal_app/screen/main_drawer.dart';
import 'package:meal_app/screen/meal_screen.dart';
import 'package:provider/provider.dart';

import '../provider/meals_data_provider.dart';

const kInitalFilter = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.veganFree: false,
  Filter.vegetrainFree: false,
};

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int selectIndex = 0;

  // void onSelectFavorite(meal) {
  //   if (favoritesMeal.contains(meal)) {
  //     setState(() {
  //       favoritesMeal.remove(meal);
  //     });
  //     showSnackBar("your favourite meal is removed");
  //   } else {
  //     setState(() {
  //       favoritesMeal.add(meal);
  //     });
  //     showSnackBar("marked as favourite");
  //   }
  // }

  void onItemTap(int index) {
    setState(() {
      selectIndex = index;
    });
  }

  // Map<Filter, bool> selectedFilter = {
  //   Filter.glutenFree: false,
  //   Filter.lactoseFree: false,
  //   Filter.veganFree: false,
  //   Filter.vegetrainFree: false,
  // };

  @override
  Widget build(BuildContext context) {
    print("tabs build");
    var dummyMeals = context.watch<MealProvider>().availabeMeal;
    final List<Meal> favoritesMeal =
        context.watch<FavrouiteMealProvider>().favoritesMeal;
    final activeFilter = context.watch<FilterProvider>().filterMeal;
    final availabeMeal = dummyMeals.where((Meal meal) {
      if (activeFilter[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (activeFilter[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (activeFilter[Filter.veganFree]! && !meal.isVegan) {
        return false;
      }
      if (activeFilter[Filter.vegetrainFree]! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();

    // ignore: non_constant_identifier_names
    Widget ActivePage = Categories(
        // onSelectFavorite: onSelectFavorite,
        availabeMeal: availabeMeal);
    String title = "Categories";
    if (selectIndex == 1) {
      ActivePage = MealScreen(
        meals: favoritesMeal,
        //  onSelectFavorite: onSelectFavorite
      );
      title = "Favorites";
    }
    void onSelectScreen(String identifer) async {
      if (identifer == 'meal') {
        Navigator.of(context).pop();
      } else {
        await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const FilterScreen()));
      }
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
