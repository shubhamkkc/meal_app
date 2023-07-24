import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:provider/provider.dart';

import '../provider/favrouite_meal_provider.dart';

class MealDetail extends StatelessWidget {
  const MealDetail(
      {
      // required this.onSelectFavorite,
      super.key,
      required this.meal});
  // final void Function(Meal meal) onSelectFavorite;

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    var favoritesMeal = context.watch<FavrouiteMealProvider>().favoritesMeal;
    bool isFavorite = favoritesMeal.contains(meal);
    print("metail detail refresh");

    void showSnackbar(message) {
      ScaffoldMessenger.of(context).clearSnackBars();
      var snackdemo = SnackBar(
        content: Text(message),
        elevation: 10,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(5),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackdemo);
    }

    return Scaffold(
        appBar: AppBar(title: Text(meal.title), actions: [
          IconButton(
            icon: isFavorite
                ? const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )
                : const Icon(Icons.favorite_border_outlined),
            onPressed: () {
              if (!favoritesMeal.contains(meal)) {
                bool isMealAdded = context
                    .read<FavrouiteMealProvider>()
                    .addToFavoritesMeal(meal);
                showSnackbar(isMealAdded
                    ? "meal added to favorites"
                    : "Meal removed from favorites");
              } else {
                bool isMealAdded = context
                    .read<FavrouiteMealProvider>()
                    .removeFromFavoritesMeal(meal);
                showSnackbar(isMealAdded
                    ? "meal added to favorites"
                    : "Meal removed from favorites");
              }
            },
          ),
        ]),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
                height: 300,
                width: double.infinity,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Ingredients",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 18,
              ),
              for (final ingredient in meal.ingredients)
                Text(ingredient,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground)),
              const SizedBox(
                height: 18,
              ),
              Text(
                "Steps",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.bold),
              ),
              for (final steps in meal.steps)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Text(steps,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground)),
                )
            ],
          ),
        ));
  }
}
