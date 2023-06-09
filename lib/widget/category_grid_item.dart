import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/models/category.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screen/meal_screen.dart';

class CateoryGridItem extends StatelessWidget {
  const CateoryGridItem({required this.category, super.key});
  final Category category;
  void selectCategory(BuildContext context, Category category) {
    final filteredMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return MealScreen(
        title: category.title,
        meals: filteredMeals,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        selectCategory(context, category);
      }),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(colors: [
                category.color.withOpacity(0.4),
                category.color.withOpacity(0.8),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              category.title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
          )),
    );
  }
}
