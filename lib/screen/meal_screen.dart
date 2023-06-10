import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screen/meal_detail_screen.dart';
import 'package:meal_app/widget/meal_item.dart';

class MealScreen extends StatelessWidget {
  const MealScreen(
      {
      // required this.onSelectFavorite,
      super.key,
      required this.meals,
      this.title,
      required this.onSelectFavorite});
  final void Function(Meal meal) onSelectFavorite;

  // final void Function(Meal meal) onSelectFavorite;

  final String? title;
  final List<Meal> meals;

  void selectDetailScreen(meal, context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => MealDetail(
            // onSelectFavorite: onSelectFavorite,
            meal: meal,
            onSelectFavorite: onSelectFavorite)));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: ((context, index) => MealItem(
            meal: meals[index],
            onSelectMeal: (meal) {
              selectDetailScreen(meal, context);
            })));

    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Uh Oh.. Nothing Here!',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              'Try Selecting the different category!',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            )
          ],
        ),
      );
    }

    if (title == null) {
      return content;
    }
    return Scaffold(appBar: AppBar(title: Text(title!)), body: content);
  }
}
