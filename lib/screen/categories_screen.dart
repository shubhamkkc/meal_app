import 'package:flutter/material.dart';

import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/models/category.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screen/meal_screen.dart';
import 'package:meal_app/widget/category_grid_item.dart';

class Categories extends StatelessWidget {
  const Categories(
      {super.key, required this.onSelectFavorite, required this.availabeMeal});
  final void Function(Meal meal) onSelectFavorite;
  final List<Meal> availabeMeal;

  void selectCategory(BuildContext context, Category category) {
    final filteredMeals = availabeMeal
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return MealScreen(
          title: category.title,
          meals: filteredMeals,
          onSelectFavorite: onSelectFavorite);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: [
          for (final category in availableCategories)
            CateoryGridItem(category: category, selectCategory: selectCategory)
        ],
      ),
    );
  }
}
