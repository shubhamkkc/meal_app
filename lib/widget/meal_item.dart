import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screen/meal_detail_screen.dart';
import 'package:meal_app/widget/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.onSelectMeal});
  final Meal meal;
  final void Function(Meal meal) onSelectMeal;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () => {onSelectMeal(meal)},
        child: Stack(children: [
          FadeInImage(
            placeholder: MemoryImage(kTransparentImage),
            image: NetworkImage(meal.imageUrl),
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                  color: Colors.black54,
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                  child: Column(
                    children: [
                      Text(
                        meal.title,
                        maxLines: 2,
                        softWrap: true,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MealItemTrait(
                            icon: Icons.schedule,
                            title: "${meal.duration} min",
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          MealItemTrait(
                            icon: Icons.work,
                            title: meal.complexity.name,
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          MealItemTrait(
                            icon: Icons.currency_rupee,
                            title: meal.affordability.name,
                          ),
                        ],
                      )
                    ],
                  )))
        ]),
      ),
    );
  }
}
