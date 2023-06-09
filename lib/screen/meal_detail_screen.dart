import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';

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
    return Scaffold(
        appBar: AppBar(title: Text(meal.title), actions: [
          IconButton(
            icon: Icon(Icons.favorite_border_outlined),
            onPressed: () {
              // onSelectFavorite(meal);
              const snackdemo = SnackBar(
                content: Text('Marked as favourite'),
                elevation: 10,
                behavior: SnackBarBehavior.floating,
                margin: EdgeInsets.all(5),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackdemo);
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
                  child: Container(
                    child: Text(steps,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground)),
                  ),
                )
            ],
          ),
        ));
  }
}
